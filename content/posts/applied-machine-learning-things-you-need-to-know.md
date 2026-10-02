---
title: Applied Machine Learning – things you need to know
description: Một số lưu ý thực tế khi áp dụng Machine Learning với scikit-learn, Keras và GridSearchCV, kèm danh sách thư viện đã dùng.
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
> **Cập nhật (2026):** Bài viết dựa trên TensorFlow 1.10, Python 3.5 và scikit-learn 0.19 (2018), tất cả đều đã lỗi thời. Hiện nay dùng TensorFlow 2.x với `tf.keras` (tham số `lr` của optimizer đã đổi thành `learning_rate`, `tf.train.AdamOptimizer` không còn), và `KerasClassifier` nay nằm trong gói `scikeras` thay vì `keras.wrappers.scikit_learn`. Các ghi chú về nguyên tắc (tách train/test, cross validation, binarize nhãn) vẫn đúng.

Một số lưu ý khi áp dụng Machine Learning để giải quyết các vấn đề cụ thể:

- Luôn dùng `train_test_split` hoặc tương đương.
- Dùng `GridSearchCV` (có sẵn cross validation).
- File HDF cần được nén lại sau khi ghi/cập nhật:

  ```bash
  ptrepack --chunkshape=auto --propindexes --complevel=9 --complib=blosc data_in.h5 data_out.h5
  ```

- Dùng optimizer của Keras thay vì của TensorFlow (để có thể lưu cùng với model sau này):

  ```python
  # nên dùng
  model.compile(optimizer=tf.keras.optimizers.Adam(lr=0.001), ...)
  # thay vì
  model.compile(optimizer=tf.train.AdamOptimizer(), ...)
  ```

- Với phân loại nhị phân: `keras.layers.Dense(1, activation=tf.nn.sigmoid)`.
- Ngoại trừ accuracy, các metric khác như f1, recall, roc_auc yêu cầu nhãn phải được binarize:

  ```python
  from sklearn.preprocessing import LabelBinarizer

  lb = LabelBinarizer()
  train_labels = lb.fit_transform(train_labels)
  test_labels = lb.fit_transform(test_labels)
  ```

- Để `GridSearchCV` tự quyết định tập train/validation; trong Keras đặt `validation_split=0, validation_data=None`.

## Đánh giá với GridSearchCV

```python
# Training
clf = KerasClassifier(build_fn=get_model)
param_grid = dict(batch_size=batch_size, epochs=epochs)
validator = GridSearchCV(estimator=clf, param_grid=param_grid,
                         scoring=scoring, refit=refit_scorer, cv=cv)
grid_result = validator.fit(train_images, train_labels,
                            validation_split=0, validation_data=None)

# Evaluation
best_estimator = grid_result.best_estimator_
final_model = "final_model_" + datetime.datetime.now().strftime("%Y-%m-%d-%H-%M") + refit_scorer + ".h5"
best_estimator.model.save(final_model)
print("Accuracy Score (test_data): ", best_estimator.score(test_images, test_labels))

cv_result = "cv_result_" + datetime.datetime.now().strftime("%Y-%m-%d-%H-%M") + ".dict"
```

## requirements.txt (Python 3.5.2)

```text
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
```
