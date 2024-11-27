#!/bin/sh

SBOM_FILE=$(mktemp)
BASE64_FILE=$(mktemp)

npx @cyclonedx/cyclonedx-npm --output-file ${SBOM_FILE}
cat ${SBOM_FILE} |base64 > ${BASE64_FILE}

cat <<EOF > ${PAYLOAD_FILE}
{
  "project": "${PROJECT_ID}",
  "bom": "$(cat ${BASE64_FILE})"
}
EOF

rm -f ${SBOM_FILE} ${BASE64_FILE}

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "X-API-Key: ${API_TOKEN}" \
    -d @${PAYLOAD_FILE} \
    "http://localhost:8081/api/v1/bom"

