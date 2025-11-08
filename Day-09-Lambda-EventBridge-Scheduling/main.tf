# IAM role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_schedule_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Effect = "Allow"
    }]
  })
}


# Attach basic Lambda execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


# Create the Lambda function
resource "aws_lambda_function" "scheduled_lambda" {
  function_name    = "scheduled_lambda"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.9"
  timeout          = 900
  memory_size      = 128
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}


# Schedule rule (runs every hour)
resource "aws_cloudwatch_event_rule" "lambda_schedule_rule" {
  name                = "lambda_hourly_schedule"
  schedule_expression = "rate(1 hour)" # or use cron() for more specific times
}


# Event target
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule_rule.name
  target_id = "lambda"
  arn       = aws_lambda_function.scheduled_lambda.arn
}


# Permission for EventBridge to invoke Lambda
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.scheduled_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule_rule.arn
}
