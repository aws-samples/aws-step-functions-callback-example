import boto3

order = {
    "order_id": {"S": "order-1234"},
    "tracking_number": {"S": "1ZA1B2C3D4"},
    "order_contents": {"M": {"shoes": {"N": "5"}, "socks": {"N": "2"}}},
}


dynamo_client = boto3.client("dynamodb")

try:
    resp = dynamo_client.get_item(
        TableName="OrderTable3", Key={"order_id": {"S": order["order_id"]["S"]}}
    )

    if item := resp.get("Item"):
        if not item["order_id"] == order["order_id"]["S"]:
            dynamo_client.put_item(TableName="OrderTable", Item=order)
    else:
        dynamo_client.put_item(TableName="OrderTable", Item=order)
except:
    print("Error writing item to table")
