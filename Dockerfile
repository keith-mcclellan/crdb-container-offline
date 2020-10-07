FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL name="Cockroach DB"
LABEL vendor="Cockroach Labs"
LABEL version="20.1.5"
LABEL release="1"
LABEL summary="CockroachDB is a Distributed SQL database."
LABEL description="CockroachDB is a PostgreSQL wire-compatable Distributed SQL database."
# For deployment, we need
# libc6 - dynamically linked by cockroach binary
# ca-certificates - to authenticate TLS connections for telemetry and
#                   bulk-io with S3/GCS/Azure
# tzdata - for time zone functions
RUN yum install -y glibc-devel ca-certificates tzdata

RUN mkdir -p /cockroach && mkdir -p /licenses
COPY cockroach.sh cockroach /cockroach/
COPY licenses/* /licenses/
# Set working directory so that relative paths
# are resolved appropriately when passed as args.
WORKDIR /cockroach/
RUN chmod 755 *
ENV COCKROACH_CHANNEL=official-openshift

EXPOSE 26257 8080
ENTRYPOINT ["/cockroach/cockroach.sh"]
