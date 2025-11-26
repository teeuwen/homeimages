variable "POSTFIX_VERSION" {
  // renovate: datasource=repology depName=alpine_3_22/postfix versioning=loose
  default = "3.10.6-r0"
}

target "default" {
  args = {
    POSTFIX_VERSION = "${POSTFIX_VERSION}"
  }
  platforms = ["linux/amd64"]
  tags = ["ghcr.io/teeuwen/postfix:${POSTFIX_VERSION}"]
}
