# Copyright 2016 Prifysgol Bangor University
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
FROM techiaith/htk
MAINTAINER Uned Technolegau Iaith, Prifysgol Bangor

RUN apt-get update && apt-get install -y python3-pip libblas-dev liblapack-dev libatlas-base-dev gfortran

WORKDIR /usr/local
RUN wget https://github.com/techiaith/Prosodylab-Aligner/archive/master.zip
RUN unzip master.zip && mv Prosodylab-Aligner-master Prosodylab-Aligner

RUN mkdir -p /usr/local/Prosodylab-Aligner/data
WORKDIR /usr/local/Prosodylab-Aligner
RUN pip3 install -r requirements.txt

ADD Cychwyn-arni.txt .

RUN python3 -m aligner --help
RUN cat Cychwyn-arni.txt

