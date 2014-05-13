MQTT and MQTT-SN CLI tools
==========================


MQTT-SN CLI tools:

``` bash
vagrant@precise64:~# mqtt-sn-pub
Usage: mqtt-sn-pub [opts] -t <topic> -m <message>

  -d             Enable debug messages.
  -h <host>      MQTT-SN host to connect to. Defaults to '127.0.0.1'.
  -i <clientid>  ID to use for this client. Defaults to 'mqtt-sn-tools-' with process id.
  -m <message>   Message payload to send.
  -n             Send a null (zero length) message.
  -p <port>      Network port to connect to. Defaults to 1883.
  -q <qos>       Quality of Service value (0 or -1). Defaults to 0.
  -r             Message should be retained.
  -t <topic>     MQTT topic name to publish to.
  -T <topicid>   Pre-defined MQTT-SN topic ID to publish to.



vagrant@precise64:~# mqtt-sn-sub 

Usage: mqtt-sn-sub [opts] -t <topic>

  -1             exit after receiving a single message.
  -c             disable 'clean session' (store subscription and pending messages when client disconnects).
  -d             Enable debug messages.
  -h <host>      MQTT-SN host to connect to. Defaults to '127.0.0.1'.
  -i <clientid>  ID to use for this client. Defaults to 'mqtt-sn-tools-' with process id.
  -k <keepalive> keep alive in seconds for this client. Defaults to 10.
  -p <port>      Network port to connect to. Defaults to 1883.
  -t <topic>     MQTT topic name to subscribe to.
  -T <topicid>   Pre-defined MQTT-SN topic ID to subscrube to.
  -v             Print messages verbosely, showing the topic name.
```

Mosquitto MQTT CLI tools:

``` bash
vagrant@precise64:~$ mosquitto_pub
Error: Both topic and message must be supplied.
mosquitto_pub is a simple mqtt client that will publish a message on a single topic and exit.
mosquitto_pub version 1.3.1 running on libmosquitto 1.3.1.

Usage: mosquitto_pub [-h host] [-p port] [-q qos] [-r] {-f file | -l | -n | -m message} -t topic
                     [-A bind_address] [-S]
                     [-i id] [-I id_prefix]
                     [-d] [--quiet]
                     [-M max_inflight]
                     [-u username [-P password]]
                     [--will-topic [--will-payload payload] [--will-qos qos] [--will-retain]]
                     [{--cafile file | --capath dir} [--cert file] [--key file]
                      [--ciphers ciphers] [--insecure]]
                     [--psk hex-key --psk-identity identity [--ciphers ciphers]]
       mosquitto_pub --help

 -A : bind the outgoing socket to this host/ip address. Use to control which interface
      the client communicates over.
 -d : enable debug messages.
 -f : send the contents of a file as the message.
 -h : mqtt host to connect to. Defaults to localhost.
 -i : id to use for this client. Defaults to mosquitto_pub_ appended with the process id.
 -I : define the client id as id_prefix appended with the process id. Useful for when the
      broker is using the clientid_prefixes option.
 -l : read messages from stdin, sending a separate message for each line.
 -m : message payload to send.
 -M : the maximum inflight messages for QoS 1/2..
 -n : send a null (zero length) message.
 -p : network port to connect to. Defaults to 1883.
 -q : quality of service level to use for all messages. Defaults to 0.
 -r : message should be retained.
 -s : read message from stdin, sending the entire input as a message.
 -S : use SRV lookups to determine which host to connect to.
 -t : mqtt topic to publish to.
 -u : provide a username (requires MQTT 3.1 broker)
 -P : provide a password (requires MQTT 3.1 broker)
 --help : display this message.
 --quiet : don't print error messages.
 --will-payload : payload for the client Will, which is sent by the broker in case of
                  unexpected disconnection. If not given and will-topic is set, a zero
                  length message will be sent.
 --will-qos : QoS level for the client Will.
 --will-retain : if given, make the client Will retained.
 --will-topic : the topic on which to publish the client Will.
 --cafile : path to a file containing trusted CA certificates to enable encrypted
            communication.
 --capath : path to a directory containing trusted CA certificates to enable encrypted
            communication.
 --cert : client certificate for authentication, if required by server.
 --key : client private key for authentication, if required by server.
 --ciphers : openssl compatible list of TLS ciphers to support.
 --tls-version : TLS protocol version, can be one of tlsv1.2 tlsv1.1 or tlsv1.
                 Defaults to tlsv1.2 if available.
 --insecure : do not check that the server certificate hostname matches the remote
              hostname. Using this option means that you cannot be sure that the
              remote host is the server you wish to connect to and so is insecure.
              Do not use this option in a production environment.
 --psk : pre-shared-key in hexadecimal (no leading 0x) to enable TLS-PSK mode.
 --psk-identity : client identity string for TLS-PSK mode.

See http://mosquitto.org/ for more information.



vagrant@precise64:~$ mosquitto_sub
Error: You must specify a topic to subscribe to.
mosquitto_sub is a simple mqtt client that will subscribe to a single topic and print all messages it receives.
mosquitto_sub version 1.3.1 running on libmosquitto 1.3.1.

Usage: mosquitto_sub [-c] [-h host] [-k keepalive] [-p port] [-q qos] [-R] -t topic ...
                     [-T filter_out]
                     [-A bind_address] [-S]
                     [-i id] [-I id_prefix]
                     [-d] [-N] [--quiet] [-v]
                     [-u username [-P password]]
                     [--will-topic [--will-payload payload] [--will-qos qos] [--will-retain]]
                     [{--cafile file | --capath dir} [--cert file] [--key file]
                      [--ciphers ciphers] [--insecure]]
                     [--psk hex-key --psk-identity identity [--ciphers ciphers]]
       mosquitto_sub --help

 -A : bind the outgoing socket to this host/ip address. Use to control which interface
      the client communicates over.
 -c : disable 'clean session' (store subscription and pending messages when client disconnects).
 -d : enable debug messages.
 -h : mqtt host to connect to. Defaults to localhost.
 -i : id to use for this client. Defaults to mosquitto_sub_ appended with the process id.
 -I : define the client id as id_prefix appended with the process id. Useful for when the
      broker is using the clientid_prefixes option.
 -k : keep alive in seconds for this client. Defaults to 60.
 -N : do not add an end of line character when printing the payload.
 -p : network port to connect to. Defaults to 1883.
 -q : quality of service level to use for the subscription. Defaults to 0.
 -R : do not print stale messages (those with retain set).
 -S : use SRV lookups to determine which host to connect to.
 -t : mqtt topic to subscribe to. May be repeated multiple times.
 -u : provide a username (requires MQTT 3.1 broker)
 -v : print published messages verbosely.
 -P : provide a password (requires MQTT 3.1 broker)
 --help : display this message.
 --quiet : don't print error messages.
 --will-payload : payload for the client Will, which is sent by the broker in case of
                  unexpected disconnection. If not given and will-topic is set, a zero
                  length message will be sent.
 --will-qos : QoS level for the client Will.
 --will-retain : if given, make the client Will retained.
 --will-topic : the topic on which to publish the client Will.
 --cafile : path to a file containing trusted CA certificates to enable encrypted
            certificate based communication.
 --capath : path to a directory containing trusted CA certificates to enable encrypted
            communication.
 --cert : client certificate for authentication, if required by server.
 --key : client private key for authentication, if required by server.
 --ciphers : openssl compatible list of TLS ciphers to support.
 --tls-version : TLS protocol version, can be one of tlsv1.2 tlsv1.1 or tlsv1.
                 Defaults to tlsv1.2 if available.
 --insecure : do not check that the server certificate hostname matches the remote
              hostname. Using this option means that you cannot be sure that the
              remote host is the server you wish to connect to and so is insecure.
              Do not use this option in a production environment.
 --psk : pre-shared-key in hexadecimal (no leading 0x) to enable TLS-PSK mode.
 --psk-identity : client identity string for TLS-PSK mode.

See http://mosquitto.org/ for more information.

vagrant@precise64:~$ 

```