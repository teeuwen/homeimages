variable "DOVECOT_VERSION" {
  // renovate: datasource=repology depName=alpine_3_23/dovecot versioning=loose
  default = "2.4.2-r1"
}

variable "RSPAMD_CLIENT_VERSION" {
  // renovate: datasource=repology depName=alpine_3_23/rspamd-client versioning=loose
  default = "3.14.0-r0"
}

target "default" {
  args = {
    DOVECOT_VERSION = "${DOVECOT_VERSION}"
    RSPAMD_CLIENT_VERSION = "${RSPAMD_CLIENT_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["ghcr.io/teeuwen/dovecot:${DOVECOT_VERSION}"]
}
