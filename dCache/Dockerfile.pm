FROM dcache
COPY pm.conf /etc/dcache/layouts/docker.conf
RUN dcache check-config

