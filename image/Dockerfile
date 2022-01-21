# Build the scorecard-test-kuttl binary
FROM --platform=$BUILDPLATFORM golang:1.17 as builder

WORKDIR /workspace
# Copy the Go Modules manifests
COPY go.mod go.mod
COPY go.sum go.sum
# cache deps before building and copying source so that we don't need to re-download as much
# and so that source changes don't invalidate our downloaded layer
RUN go mod download

# Copy the go source
COPY . .

# Build
RUN GOOS=linux GOARCH=amd64 make build

FROM kudobuilder/kuttl:v0.11.1

ENV HOME=/opt/scorecard-test-kuttl \
    USER_NAME=scorecard-test-kuttl \
    USER_UID=1001 \
    KUBECONFIG=

RUN echo "${USER_NAME}:x:${USER_UID}:0:${USER_NAME} user:${HOME}:/sbin/nologin" >> /etc/passwd

WORKDIR ${HOME}

COPY --from=builder /workspace/scorecard-test-kuttl /usr/local/bin/scorecard-test-kuttl
COPY --from=builder /workspace/image/entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}
