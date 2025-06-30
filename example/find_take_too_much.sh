#!/bin/bash

./columnq sql --table alblog20250630.json "
SELECT
  timestamp
  , (CAST(request_processing_time AS FLOAT) + CAST(target_processing_time AS FLOAT) + CAST(response_processing_time AS FLOAT)) AS total_time
  , host
  , domain_name
  , uri
  , method
  , client
FROM alblog20250630
WHERE
  (CAST(request_processing_time AS FLOAT) + CAST(target_processing_time AS FLOAT) + CAST(response_processing_time AS FLOAT)) > 30
ORDER BY total_time DESC
"
