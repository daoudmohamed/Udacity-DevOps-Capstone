aws cloudformation deploy \
--stack-name $1 \
--template-file file://$2 \
--parameters file://$3 \
--capabilities CAPABILITY_IAM