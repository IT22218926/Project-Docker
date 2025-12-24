$TTL  1h
@     IN SOA  ns1.csne.vcct.com. admin.csne.vcct.com. (
              2025092301 ; serial
              1h         ; refresh
              15m        ; retry
              1w         ; expire
              1h )       ; minimum

      IN NS   ns1.csne.vcct.com.
ns1   IN A    192.168.8.2
@     IN A    192.168.8.132

