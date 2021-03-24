## aws-step-functions-callback-example
This sample application accompanies the AWS Compute Blog post [Integrating Step Functions Callbacks and External Systems](https://aws.amazon.com/blogs/compute/integrating-aws-step-functions-callbacks-and-external-systems/)
### Deploying the Example Application
1) Install [AWS SAM](https://aws.amazon.com/serverless/sam/)
2) Ensure your AWS credentials are correctly configured
3) Set the `SAM_BUCKET_NAME` environment variable to specify the S3 bucket to use for SAM packaging
4) Set the `CALLBACK_EMAIL` environment variable to specify the email you want to receive the Step Functions callback token
5) Run `make`

### Cleaning Up
Ensure your AWS credentials are correctly configured and run `make destroy`

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

