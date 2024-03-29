FROM python:3.9

WORKDIR /code

COPY ./setup.py /code/setup.py

COPY ./requirements.txt /code/requirements.txt

COPY ./README.md /code/README.md

COPY ./src /code/src

RUN pip install /code

COPY ./controller /code/controller

# Added thoses 3  next line to remove Security Hotspot
RUN addgroup --system nonrootgroup

RUN  adduser --system nonrootuser --ingroup nonrootgroup

USER nonrootuser


CMD ["uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]
