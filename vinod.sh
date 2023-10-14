#!/bin/bash

# List all buckets and iterate through them to delete each one
for bucket in $(aws s3 ls | awk '{print $3}'); do
  # Skip deletion of buckets with 'aws-elasticbeanstalk-' prefix
  if [[ $bucket != "aws-elasticbeanstalk-"* ]]; then
    echo "Deleting bucket: $bucket"
    aws s3 rb "s3://${bucket}" --force
  else
    echo "Skipping Elastic Beanstalk bucket: $bucket"
  fi
done

echo "All buckets have been deleted."
