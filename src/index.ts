import * as zmq from "zeromq"

async function run() {
  const sock = new zmq.Subscriber

  sock.connect("tcp://pubsub.besteffort.ndovloket.nl:7664")
  await sock.subscribe("/RIG/InfoPlusRITInterface2")
  console.log("ZMQ connected")

  for await (const [msg] of sock) {
    console.log("work: %s", msg.toString())
  }
}

run()