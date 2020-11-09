import json

# Standard usage and with cloudWatch cronTab
# def handler(event, context):
#     print('Hello python lambda')

# With SQS
def handler(event, context):
    for record in event["Records"]:
        body = record['body']
        event_json = json.loads(body)
        handle_event(event_json)

def handle_event(event):
    print(f'handling event: {event}')
