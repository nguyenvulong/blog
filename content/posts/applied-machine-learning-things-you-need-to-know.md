---
title: Applied Machine Learning – things you need to know
author: admin
type: post
date: 2018-11-20T03:01:04+00:00
url: /applied-machine-learning-things-you-need-to-know/
categories:
  - Big Data
  - IT
  - Linux
  - Machine Learning
tags:
  - data science
  - deep learning
  - keras
  - machine learning
  - pandas
  - python

---
Một số lưu ý khi áp dụng Machine Learning để giải quyết các vấn đề cụ thể:

Always use train\_test\_split or similar

GridSearchCV (built-in cross validation)

HDF need to be shrunk after write/update &#8211;>

_**ptrepack &#8211;chunkshape=auto &#8211;propindexes &#8211;complevel=9 &#8211;complib=blosc data\_in.h5 data\_out.h5**_

Use Keras optimizer instead of tensorflow itself (so that it can be saved later as part of the model)

_**model.compile(optimizer=tf.keras.optimizers.Adam(lr=0.001), instead of: **_  
_**model.compile(optimizer=tf.train.AdamOptimizer()**_

For binary classification: _**keras.layers.Dense(1, activation=tf.nn.sigmoid)**_

Except accuracy metric, other metrics like f1, recall, roc_auc when used then labels should be binarized:

_**from sklearn.preprocessing import LabelBinarizer**_  
_**lb = LabelBinarizer()**_  
_**train\_labels = lb.fit\_transform(train_labels)**_  
_**test\_labels = lb.fit\_transform(test_labels)**_

Let GridSearchCV decided the train-validation data  
in Keras: _**validation\_split=0, validation\_data=None**_

&nbsp;

GridSearchCV evaluation:

_**#Training**_  
_**clf = KerasClassifier(build\_fn=get\_model)**_  
_**param\_grid = dict(batch\_size=batch_size, epochs=epochs)**_  
_**validator = GridSearchCV(estimator=clf, param\_grid=param\_grid, scoring=scoring, refit=refit_scorer, cv=cv)**_  
_**grid\_result = validator.fit(train\_images, train\_labels, validation\_split=0, validation_data=None)**_

_**#Evaluation**_  
_**best\_estimator = grid\_result.best\_estimator\_**_  
_**final\_model = &#8220;final\_model\_&#8221; + datetime.datetime.now().strftime(&#8220;%Y-%m-%d-%H-%M&#8221;) + refit\_scorer + &#8220;.h5&#8221;**_  
_**best\_estimator.model.save(final\_model)**_  
_**print(&#8220;Accuracy Score (test\_data): &#8220;, best\_estimator.score(test\_images, test\_labels))**_

_**cv\_result = &#8220;cv\_result_&#8221; + datetime.datetime.now().strftime(&#8220;%Y-%m-%d-%H-%M&#8221;) + &#8220;.dict&#8221;**_

&nbsp;

requirements.txt <Python 3.5.2>

absl-py==0.4.1  
astor==0.7.1  
backcall==0.1.0  
bleach==2.1.4  
certifi==2018.8.24  
chardet==3.0.4  
Click==7.0  
cycler==0.10.0  
decorator==4.3.0  
entrypoints==0.2.3  
Flask==1.0.2  
Flask-SQLAlchemy==2.3.2  
gast==0.2.0  
grpcio==1.14.2  
h5py==2.8.0  
html5lib==1.0.1  
idna==2.7  
ipykernel==4.9.0  
ipython==6.5.0  
ipython-genutils==0.2.0  
ipywidgets==7.4.1  
itsdangerous==0.24  
jedi==0.12.1  
Jinja2==2.10  
joblib==0.13.0  
jsonschema==2.6.0  
jupyter==1.0.0  
jupyter-client==5.2.3  
jupyter-console==5.2.0  
jupyter-core==4.4.0  
kiwisolver==1.0.1  
Markdown==2.6.11  
MarkupSafe==1.0  
matplotlib==2.2.3  
mistune==0.8.3  
nbconvert==5.3.1  
nbformat==4.4.0  
notebook==5.6.0  
numexpr==2.6.8  
numpy==1.14.5  
pandas==0.23.4  
pandocfilters==1.4.2  
parso==0.3.1  
pexpect==4.6.0  
pickleshare==0.7.4  
prometheus-client==0.3.1  
prompt-toolkit==1.0.15  
protobuf==3.6.1  
ptyprocess==0.6.0  
Pygments==2.2.0  
pymongo==3.7.2  
pyparsing==2.2.0  
python-dateutil==2.7.3  
pytz==2018.5  
pyzmq==17.1.2  
qtconsole==4.4.1  
requests==2.19.1  
scikit-learn==0.19.2  
scipy==1.1.0  
Send2Trash==1.5.0  
simplegeneric==0.8.1  
six==1.11.0  
SQLAlchemy==1.2.12  
tables==3.4.4  
tensorboard==1.10.0  
tensorflow==1.10.1  
termcolor==1.1.0  
terminado==0.8.1  
testpath==0.3.1  
tornado==5.1  
tqdm==4.26.0  
traitlets==4.3.2  
urllib3==1.23  
wcwidth==0.1.7  
webencodings==0.5.1  
Werkzeug==0.14.1  
widgetsnbextension==3.4.1

&nbsp;

To be updated
