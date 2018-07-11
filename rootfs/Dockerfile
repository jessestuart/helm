# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG TARGET

FROM alpine:3.7 as certs
# hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates

FROM $TARGET/alpine:3.7
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ARG BIN_DIR

COPY ${BIN_DIR}/helm /bin/helm
COPY ${BIN_DIR}/tiller /bin/tiller

EXPOSE 44134
USER nobody
ENTRYPOINT ["/bin/tiller"]
