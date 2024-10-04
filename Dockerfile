FROM continuumio/miniconda3

RUN apt-get update
RUN apt-get install nano unzip curl -y

RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app

RUN pip install boto3 pandas gunicorn streamlit scikit-learn matplotlib seaborn plotly

COPY --chown=user . $HOME/app

EXPOSE 7860

CMD streamlit run --server.port 7860 app.py