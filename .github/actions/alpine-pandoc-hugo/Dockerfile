FROM pandoc/latex:2.19.2

COPY install-packages.sh /root/install-packages.sh
RUN /root/install-packages.sh && rm -rf /root/install-packages.sh

COPY delete-script.rb /opt/delete-script.rb
RUN chmod +x /opt/delete-script.rb

ENTRYPOINT ["sh", "-c"]
