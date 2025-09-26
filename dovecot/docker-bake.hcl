variable "DOVECOT_VERSION" {
  // renovate: datasource=repology depName=alpine_3_22/dovecot versioning=loose
  default = "2.4.1-r2"
}

variable "RSPAMD_CLIENT_VERSION" {
  // renovate: datasource=repology depName=alpine_3_22/rspamd-client versioning=loose
  default = "3.11.1-r2"
}

target "default" {
  args = {
    DOVECOT_VERSION = "${DOVECOT_VERSION}"
    RSPAMD_CLIENT_VERSION = "${RSPAMD_CLIENT_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["ghcr.io/teeuwen/dovecot:${DOVECOT_VERSION}"]
}
