FROM sebp/elk

WORKDIR ${LOGSTASH_HOME}

# Plugins to install
RUN gosu logstash bin/logstash-plugin install logstash-input-udp
RUN gosu logstash bin/logstash-plugin install logstash-codec-json_lines

# Add LogStash Listeners
ADD ./rails-udp-input.conf /etc/logstash/conf.d/rails-udp-input.conf