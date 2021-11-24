all: deploy

check-environment-variables:
ifndef SAM_BUCKET_NAME
	$(error SAM_BUCKET_NAME is not set)
endif
ifndef CALLBACK_EMAIL
	$(error CALLBACK_EMAIL is not set)
endif

deploy: check-environment-variables
	sam package --s3-bucket ${SAM_BUCKET_NAME} --output-template-file packaged.yaml
	sam deploy \
	--template-file packaged.yaml \
	--stack-name aws-step-functions-callback-example \
	--capabilities CAPABILITY_IAM \
	--parameter-overrides CallbackEmail=${CALLBACK_EMAIL}
	python3 ./insert_order.py

destroy:
	aws cloudformation delete-stack --stack-name aws-step-functions-callback-example