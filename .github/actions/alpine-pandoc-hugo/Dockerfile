FROM pandoc/latex:latest

COPY install-packages.sh /root/install-packages.sh
RUN /root/install-packages.sh && rm -rf /root/install-packages.sh

RUN apk --no-cache add ruby git
COPY delete-script.rb /opt/delete-script.rb
RUN chmod +x /opt/delete-script.rb

ENTRYPOINT ["sh", "-c"]
