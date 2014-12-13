### MQTT and MQTT-SN CLI tools


A simple Ubuntu Vagrant box with MQTT and MQTT-SN CLI tools installed.

Tools installed:
- Mosquitto v1.3.5 MQTT Broker + MQTT CLI clients mosquitto_pub / mosquitto_sub
- RSMB MQTT/MQTT-SN Broker
- mqtt-sn-tools (inlcudes CLI tools: mqtt-sn-pub and mqtt-sn-sub) 


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

```

RSMB MQTT only Broker:

``` bash
vagrant@precise64:~$ broker       
20141014 202817.049 CWNAN9999I Really Small Message Broker
20141014 202817.049 CWNAN9998I Part of Project Mosquitto in Eclipse
(http://projects.eclipse.org/projects/technology.mosquitto)
20141014 202817.050 CWNAN0053I Version 1.3.0.2, Oct 14 2014 20:26:51
20141014 202817.050 CWNAN0054I Features included: bridge 
20141014 202817.050 CWNAN9993I Authors: Ian Craggs (icraggs@uk.ibm.com), Nicholas O'Leary
20141014 202817.050 CWNAN0014I MQTT protocol starting, listening on port 1883
^C20141014 202819.605 CWNAN0046I Broker stopping
20141014 202819.605 CWNAN0016I MQTT protocol stopping
20141014 202819.606 CWNAN0044I Messages sent: 0
20141014 202819.606 CWNAN0043I Messages received: 0
20141014 202819.606 CWNAN0042I Uptime: 2 seconds
20141014 202819.606 CWNAN0055I Maximum heap use: 66528 bytes
20141014 202819.606 CWNAN0047I Broker stopped
vagrant@precise64:~$ ^C
```

RSMB MQTT + MQTT-SN Broker:

``` bash
vagrant@precise64:~$ broker_mqtts 
20141014 202804.354 CWNAN9999I Really Small Message Broker
20141014 202804.355 CWNAN9998I Part of Project Mosquitto in Eclipse
(http://projects.eclipse.org/projects/technology.mosquitto)
20141014 202804.359 CWNAN0053I Version 1.3.0.2, Oct 14 2014 20:26:56
20141014 202804.359 CWNAN0054I Features included: bridge MQTTS 
20141014 202804.359 CWNAN9993I Authors: Ian Craggs (icraggs@uk.ibm.com), Nicholas O'Leary
20141014 202804.359 CWNAN0014I MQTT protocol starting, listening on port 1883
^C20141014 202809.165 CWNAN0046I Broker stopping
20141014 202809.165 CWNAN0016I MQTT protocol stopping
20141014 202809.165 CWNAN0301I MQTT-S protocol stopping
20141014 202809.166 CWNAN0044I Messages sent: 0
20141014 202809.166 CWNAN0043I Messages received: 0
20141014 202809.166 CWNAN0042I Uptime: 5 seconds
20141014 202809.166 CWNAN0055I Maximum heap use: 132496 bytes
20141014 202809.166 CWNAN0047I Broker stopped
vagrant@precise64:~$ ^C
```

----------------------------------------------------------------------------------------------------

## How to install

Assumes Ubuntu 12.04 LTS OS

----------------------------------------------------------------------------------------------

## How to install

Assume Ubuntu/Debian OS.

1. Configure git and github on your host OS. You should use SSH authentication.

    [Generating SSH keys](https://help.github.com/articles/generating-ssh-keys)

2. Install latest VirtualBox from https://www.virtualbox.org/wiki/Downloads
    ``` bash
    cd ~/Downloads
    wget http://download.virtualbox.org/virtualbox/4.3.20/virtualbox-4.3_4.3.20-96996~Ubuntu~precise_amd64.deb
  sudo dpkg -i virtualbox-4.3_4.3.20-96996~Ubuntu~precise_amd64.deb

  VBoxManage --version

  # if doesn't work then run:
  sudo /etc/init.d/vboxdrv setup
    ```

3. Install latest Vagrant from https://www.vagrantup.com/downloads.html
    ``` bash
  cd ~/Downloads/
  wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.1_x86_64.deb
  sudo dpkg -i vagrant_1.7.1_x86_64.deb

  # add to your ~/.bashrc
  export PATH=$PATH:/opt/vagrant/bin

  vagrant version

  # Vagrant 1.7.1
    ```

4. Do:

    ``` bash
    git clone git@github.com:zadata/mqtt_tools.git
    cd mqtt_tools/
    vagrant up
    vagrant ssh
    ```

5. Enjoy!
