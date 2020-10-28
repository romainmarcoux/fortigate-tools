#!/bin/bash
grep -v -P 'set uuid.*|set password ENC.*|set snmp-index.*|set fixed-key ENC.*|set store-passphrase ENC.*|set key ENC.*|set secondary-key ENC.*|set secondary-secret ENC.*|set secret ENC.*|set passwd ENC.*|set logon-password ENC.*' $1 | sed '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/d' | sed '/-----BEGIN ENCRYPTED PRIVATE KEY-----/,/-----END ENCRYPTED PRIVATE KEY-----/d' | sed '/-----BEGIN OPENSSH PRIVATE KEY-----/,/-----END OPENSSH PRIVATE KEY-----/d'

