from kafka import KafkaProducer
import random

import time
import json


bootstrap_server = ["localhost:9092"]

topic = "kseb"

producer = KafkaProducer(bootstrap_servers = bootstrap_server)

producer = KafkaProducer()

def senddata():
    data = random.randint(1,10)
    datasend= "{'user_id':1,'unit':"+str(data)+"}"
    print(datasend)
    message = producer.send(topic,bytes(datasend,"utf-8"))
    metadata = message.get()
    print(metadata.topic)
    print(metadata.partition)
    time.sleep(5)

while True:
    senddata()