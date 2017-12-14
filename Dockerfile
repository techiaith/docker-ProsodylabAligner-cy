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

RUN apt-get update && apt-get install -y python3-pip libblas-dev liblapack-dev libatlas-base-dev gfortran locales

RUN locale-gen cy_GB.UTF-8 
ENV LANG cy_GB.UTF-8
ENV LANGUAGE cy_GB.cy
ENV LC_ALL cy_GB.UTF-8

RUN mkdir -p /usr/local/Prosodylab-Aligner/src
WORKDIR /usr/local/Prosodylab-Aligner/src

ADD Prosodylab-Aligner/requirements.txt .
RUN pip3 install -r requirements.txt

RUN mkdir -p /usr/local/Prosodylab-Aligner/training/scripts
ADD scripts /usr/local/Prosodylab-Aligner/training/scripts

