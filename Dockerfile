FROM shoothzj/compile:go AS compiler

RUN git clone --depth 1 https://github.com/coredns/coredns

COPY hack/Makefile /coredns/Makefile

RUN cd coredns && \
make

FROM shoothzj/base:go

ENV COREDNS_HOME /opt/coredns

COPY --from=compiler /coredns/coredns /opt/coredns/coredns

WORKDIR /opt/coredns
