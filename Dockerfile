FROM ttbb/base:goc AS compiler

RUN git clone --depth 1 https://github.com/coredns/coredns && \
cd coredns && \
make

FROM ttbb/base

ENV COREDNS_HOME /opt/sh/coredns

COPY --from=compiler /opt/sh/coredns/coredns /opt/sh/coredns/coredns

WORKDIR /opt/sh/coredns
