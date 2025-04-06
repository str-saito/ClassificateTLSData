# ClassificateTLSData

## Preparation(docker & Jupyter Lab)

```
mkdir data
wget https://prod-dcd-datasets-cache-zipfiles.s3.eu-west-1.amazonaws.com/xw7r4tt54g-1.zip
unzip xw7r4tt54g-1.zip
find . -depth -type d -name "* *" -exec bash -c 'for f; do new=$(echo "$f" | tr -d " "); echo "Renaming: $f -> $new"; mv "$f" "$new"; done' _ {} +
docker image build -t ctlsd .
```

## Execution(docker & Jupyter Lab)
```
docker run -v $PWD:/app -it --gpus all --rm -p 8888:8888 ctlsd:latest
# jupyter-lab --no-browser --ip 0.0.0.0 --allow-root --NotebookApp.token='' 
```

