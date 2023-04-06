#!/usr/bin/env python
# coding: utf-8

# In[1]:




# In[2]:


import time
from collections import OrderedDict
from options.test_options import TestOptions
from data.data_loader import CreateDataLoader
from models.models import create_model
import util.util as util
import os
import numpy as np
import torch
from torch.autograd import Variable

#from tensorboardX import SummaryWriter
import cv2
#writer = SummaryWriter('runs/G1G2')

from PIL import Image
import IPython
import sys


# In[3]:


print(os.getcwd())


# In[4]:


from predict_pose import generate_pose_keypoints


# In[7]:


print(os.getcwd() +'\\U-2-Net')
sys.path.append(os.getcwd() +'\\U-2-Net')

import u2net_load
import u2net_run


# In[10]:


def change_dir(path):
    os.chdir(path)

change_dir('D:/acgpn-colab-original/U-2-Net')

u2net = u2net_load.model(model_name = 'u2netp')

SIZE = 320
NC = 14


# In[14]:


def generate_label_plain(inputs):
    size = inputs.size()
    pred_batch = []
    for input in inputs:
        input = input.view(1, NC, 256, 192)
        pred = np.squeeze(input.data.max(1)[1].cpu().numpy(), axis=0)
        pred_batch.append(pred)

    pred_batch = np.array(pred_batch)
    pred_batch = torch.from_numpy(pred_batch)
    label_batch = pred_batch.view(size[0], 1, 256, 192)

    return label_batch


def generate_label_color(inputs):
    label_batch = []
    for i in range(len(inputs)):
        label_batch.append(util.tensor2label(inputs[i], NC))
    label_batch = np.array(label_batch)
    label_batch = label_batch * 2 - 1
    input_label = torch.from_numpy(label_batch)

    return input_label


def complete_compose(img, mask, label):
    label = label.cpu().numpy()
    M_f = label > 0
    M_f = M_f.astype(np.int)
    M_f = torch.FloatTensor(M_f).cuda()
    masked_img = img*(1-mask)
    M_c = (1-mask.cuda())*M_f
    M_c = M_c+torch.zeros(img.shape).cuda()  # broadcasting
    return masked_img, M_c, M_f


def compose(label, mask, color_mask, edge, color, noise):
    masked_label = label*(1-mask)
    masked_edge = mask*edge
    masked_color_strokes = mask*(1-color_mask)*color
    masked_noise = mask*noise
    return masked_label, masked_edge, masked_color_strokes, masked_noise


def changearm(old_label):
    label = old_label
    arm1 = torch.FloatTensor((old_label.cpu().numpy() == 11).astype(np.int))
    arm2 = torch.FloatTensor((old_label.cpu().numpy() == 13).astype(np.int))
    noise = torch.FloatTensor((old_label.cpu().numpy() == 7).astype(np.int))
    label = label*(1-arm1)+arm1*4
    label = label*(1-arm2)+arm2*4
    label = label*(1-noise)+noise*4
    return label


# In[16]:

def main():

    sorted(os.listdir('D:/acgpn-colab-original/inputs/cloth'))


# In[17]:


    cloth_name = f'img_{int(time.time())}.png'
    
    cloth_path = os.path.join('D:/acgpn-colab-original/inputs/cloth', sorted(os.listdir('D:/acgpn-colab-original/inputs/cloth'))[0])
    cloth = Image.open(cloth_path)
    cloth = cloth.resize((192,256), Image.BICUBIC).convert('RGB')
    cloth.save(os.path.join('D:/acgpn-colab-original/Data_preprocessing/test_color', cloth_name))


# In[44]:


    u2net_run.infer(u2net, 'D:/acgpn-colab-original/Data_preprocessing/test_color', 'D:/acgpn-colab-original/Data_preprocessing/test_edge')


# In[19]:


    print('옷 마스크 추출')
    print(cloth_name)
    print(cloth_path)


# In[20]:


    sorted(os.listdir('D:/gdrive-acgpn/ACGPN/inputs/img'))


# In[21]:


    img_name = f'img_{int(time.time())}.png'

    img_path = os.path.join('D:/acgpn-colab-original/inputs/img', sorted(os.listdir('D:/acgpn-colab-original/inputs/img'))[0])
    img = Image.open(img_path)
    img = img.resize((192,256), Image.BICUBIC)
    img_path = os.path.join('D:/acgpn-colab-original/Data_preprocessing/test_img', img_name)
    img.save(img_path)


# In[22]:


    print('모델 마스크 추출')
    print(img_name)
    print(img_path)


# In[27]:


    print('여기임')
    print(os.getcwd())
    print('여기임')
    
   # change_dir('D:/acgpn-colab-original/Self-Correction-Human-Parsing-for-ACGPN')
    change_dir('D:/acgpn-colab-original')
    
    print('바꾼 디렉')
    print(os.getcwd())
    print('바꾼 디렉')


# In[53]:


    os.system("python D:/acgpn-colab-original/Self-Correction-Human-Parsing-for-ACGPN/simple_extractor.py --dataset lip --model-restore D:/acgpn-colab-original/lip_final.pth --input-dir D:/acgpn-colab-original/Data_preprocessing/test_img --output-dir D:/acgpn-colab-original/Data_preprocessing/test_label")


# In[31]:


    print(os.getcwd())


# In[32]:


    change_dir('D:/acgpn-colab-original')

    pose_path = os.path.join('D:/acgpn-colab-original/Data_preprocessing/test_pose', img_name.replace('.png', '_keypoints.json'))
    generate_pose_keypoints(img_path, pose_path)


# In[33]:


    print(os.getcwd())


# In[34]:


    os.remove('D:/acgpn-colab-original/Data_preprocessing/test_pairs.txt')


# In[36]:


    with open('D:/acgpn-colab-original/Data_preprocessing/test_pairs.txt', 'w') as f:
        f.write(f'{img_name} {cloth_name}')


# In[66]:


    os.makedirs('sample', exist_ok=True)
    opt = TestOptions().parse()
    print('opt = ', opt)
    print(type(opt))



# In[ ]:


    print('여기는 dataloader')

    data_loader = CreateDataLoader(opt)
    dataset = data_loader.load_data()
    dataset_size = len(data_loader)
    print('# Inference images = %d' % dataset_size)

    print('모델 생성')


# In[ ]:


    model = create_model(opt)
    
    print('여기는 지나감')

    print('dataset = ',dataset)
    print(type(dataset))
    
    print(len(dataset.dataset), dataset.batch_size)


# In[ ]:


    for i, data in enumerate(dataset):
        
      print('반복문 시작')

      # add gaussian noise channel
      # wash the label
      t_mask = torch.FloatTensor(
          (data['label'].cpu().numpy() == 7).astype(np.float))
      #
       # data['label'] = data['label'] * (1 - t_mask) + t_mask * 4
      mask_clothes = torch.FloatTensor(
           (data['label'].cpu().numpy() == 4).astype(np.int))
      mask_fore = torch.FloatTensor(
          (data['label'].cpu().numpy() > 0).astype(np.int))
      img_fore = data['image'] * mask_fore
      img_fore_wc = img_fore * mask_fore
      all_clothes_label = changearm(data['label'])

       ############## Forward Pass ######################
      fake_image, warped_cloth, refined_cloth = model(Variable(data['label'].cuda()), Variable(data['edge'].cuda()), Variable(img_fore.cuda()), Variable(
           mask_clothes.cuda()), Variable(data['color'].cuda()), Variable(all_clothes_label.cuda()), Variable(data['image'].cuda()), Variable(data['pose'].cuda()), Variable(data['image'].cuda()), Variable(mask_fore.cuda()))

      #### 만든 것 저장
      print('만든거 저장중')

      # make output folders
        
      print('경로 뽑아내기')
      print (opt.results_dir)
      print(opt.phase)
      print(output_dir)
        
      output_dir = os.path.join(opt.results_dir, opt.phase)
      fake_image_dir = os.path.join(output_dir, 'try-on')
      os.makedirs(fake_image_dir, exist_ok=True)
      warped_cloth_dir = os.path.join(output_dir, 'warped_cloth')
      os.makedirs(warped_cloth_dir, exist_ok=True)
      refined_cloth_dir = os.path.join(output_dir, 'refined_cloth')
      os.makedirs(refined_cloth_dir, exist_ok=True)

      # save output
      for j in range(opt.batchSize):
          print("Saving", data['name'][j])
          util.save_tensor_as_image(fake_image[j],
                                  os.path.join(fake_image_dir, data['name'][j]))
          util.save_tensor_as_image(warped_cloth[j],
                                    os.path.join(warped_cloth_dir, data['name'][j]))
          util.save_tensor_as_image(refined_cloth[j],
                                      os.path.join(refined_cloth_dir, data['name'][j]))

    ####
    #### 완성한 이미지 보여주기
    ####
  #  output_grid = np.concatenate([
  #  np.array(Image.open(f'D:/gdrive-acgpn/ACGPN/Data_preprocessing/test_img/{img_name}')),
  #  np.array(Image.open(f'D:/gdrive-acgpn/ACGPN/Data_preprocessing/test_color/{cloth_name}')),
  #  np.array(Image.open(f'results/test/try-on/{img_name}'))
  #  ], axis=1)

  #  image_grid = Image.fromarray(output_grid)

  #  image_grid

    print('끝!')

if __name__ == '__main__':
    main()


# In[ ]:





# 
