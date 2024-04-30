all: 
	aws s3 sync . s3://leap-insights
	aws cloudfront create-invalidation --distribution-id E3BPM9CV8LUEX2 --paths /* > /dev/null 2>&1

