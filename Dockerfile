FROM continuumio/miniconda:latest
RUN conda update -n base -c defaults conda

ADD . /

RUN conda env update -n root -f conda.yaml

ENV MLFLOW_TRACKING_URI=http://mlflow-server-test-route-aiops-kubeflow.cloud.paas.upshift.redhat.com/
CMD ["mlflow","run", ".", "--no-conda","-P","momentum=0.9"]
