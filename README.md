# CockroachDB Offline Container Build
 
## How to build
- Download release binary and extract `cockroach` to root directory.
- Edit Dockerfile version label to correct version for the downloaded binary
  - Example dockerfile is using the UBI image from Red Hat
- run `docker build --no-cache .`
- tag container as `cockroachdb/cockroach:${version}` using `docker tag ${build-id} cockroachdb/cockroach:${version}`
- either push container to your container repository of choice using `docker push` or export the container to a gzip file using `docker export cockroachdb/cockroach:${version} | gzip > cockroachdb.tgz` 
