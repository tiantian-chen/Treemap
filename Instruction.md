<h1><center>使用说明</center></h1>
 

# **1. Single Treemap**

#### 1.1 "Data type"这个功能插件可以让用户选择输入数据中包含的变量数量，支持包含一种或者两种变量的数据，用户可根据需求选择上传文件或是粘贴数据，用户可先点击Upload input data选择上传文件，再点击Browse上传本地数据；用户如果想要了解数据格式和画出的图形效果，可以先点击Download example data下载样本文档，再点击Browse上传样本数据。用户也可以点击Paste input data来选择粘贴上传数据，此时文本框中就会出现样本数据，数据的格式应符合下列要求。

 - **当输入数据只有一种变量时数据应只有两列。**
  
 - **第一列**: **数据分组。**

  

 - **第二列**: **分组对应的变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	27117.96
JiangSu	    25878.38
ShanDong	18055.50
ZheJiang	16347.00
HeNan	    13306.65
```
****
 - **当输入数据包含两种变量时数据应只有三列。**
  
 - **第一列**: **数据分组。**

  

 - **第二列**: **分组对应的一种变量大小。**

  

 - **第三列**: **分组对应的另一种变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	27117.96	11169
JiangSu	    25878.38	8029.30
ShanDong	18055.50	    10005.83
ZheJiang	16347.00    5657.00
HeNan	    13306.65	9559.13
```
****
### **1.2 点击Submit!运行这个shiny程序，进而出来用上传数据画出的treepmap图。**

### **1.3 数据颜色**

**数据颜色是让Treemap图数据不单调，变得明显。用于渲染数据的颜色，用户可以通过Plot color这个部件来选择颜色。默认情况下，将使用shiny指定的颜色。** 

### **1.4 图例命名**

**"Color value"可以使用户实现根据自己上传数据内容命名图例**

### **1.5 标题命名**

**用户可通过修改"Plot title"来按照自己的喜好对Treemap图进行命名。**

### **1.6 图的高度**

**通过"Plot height"用户可以自定义所输出图的高度。**

### **1.7 图的宽度**

**通过"Plot width"用户可以自定义所输出图的宽度。**

#### **1.8 图例大小**

**“Legend size"这个功能部件可让用户自定义调节图例的大小。**

### **1.9 标题大小**

**“Title size"这个功能部件可让用户自定义调节标题的大小。**

### **1.10 标签标题大小**

**滑动"GroupLabels size"用户可根据自己的喜好调整标签的大小，1为一个数值单位，要求调整后的数值为整数。**

### **1.11 下载图片大小**

**通过点击“Adjust the image download ratio”中“Plot download height”可以调整下载图片的高,同时“Plot download width”可以调整下载图片的宽的比例。**


# **2. Double Treemap**

#### 2.1 "Data type"这个功能插件可以让用户选择输入数据中包含的变量数量，支持包含一种或者两种变量的数据，用户可根据需求选择上传文件或是粘贴数据，用户可先点击Upload input data选择上传文件，再点击Browse上传本地数据；用户如果想要了解数据格式和画出的图形效果，可以先点击Download example data下载样本文档，再点击Browse上传样本数据。用户也可以点击Paste input data来选择粘贴上传数据，此时文本框中就会出现样本数据，数据的格式应符合下列要求。

 - **当输入数据只有一种变量时数据应只有三列。**
  
 - **第一列**: **数据分组。**

  

 - **第二列**: **数据子组。**

 

 - **第三列**: **分组对应的变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	ShenZhen	27670.24
GuangDong	GuangZhou	25019.11
GuangDong	FoShan	    10816.47
GuangDong	DongWan	    9650.19
GuangDong	HuiZhou	    4221.79
GuangDong	ZhuHai	    3481.90
GuangDong	MaoMing	    3279.31
```
 - **当输入数据包含两种变量时数据应只有四列。**
  
 - **第一列**: **数据分组。**

  

 - **第二列**: **数据子组。**

 

 - **第三列**: **分组对应的一种变量大小。**

  

 - **第四列**: **分组对应的另一种变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	ShenZhen	27670.24	1302.66
GuangDong	GuangZhou	25019.11	1000.28
GuangDong	FoShan	    10816.47	790.57
GuangDong	DongWan	    9650.19	    623.70
GuangDong	HuiZhou	    4221.79	    483.00
GuangDong	ZhuHai	    3481.94	    189.11
GuangDong	MaoMing	    3279.31	    213.50
```

### **2.2 点击Submit!运行这个shiny程序，进而出来用上传数据画出的treepmap图。**

### **2.3 数据颜色**

**数据颜色是让Treemap图数据不单调，变得明显。用于渲染数据的颜色，用户可以通过Plot color这个部件来选择颜色。默认情况下，将使用shiny指定的颜色。** 

### **2.4 图的类型**

**用户可以在Plot type 这个功能部件中选择输出的Treemap类型，其中包括"Static treemap"(静态的treemap图)、"Interactive treemap"(交互式的treemap图)以及"Advanced interactive treemap"(高级交互的treemap图)。**

### **2.5 图的类型--"Static treemap"**
**用户在Plot type 这个功能部件中选择"Static treemap"时可以额外对以下功能部件做出修改。**

##### 2.5.1 图例命名
**"Color value"可以使用户实现根据自己上传数据内容命名图例。**
##### 2.5.2图例大小
**“Legend size"这个功能部件可让用户自定义调节图例的大小。**
##### 2.5.3 标签标题大小
**滑动"GroupLabels size"用户可根据自己的喜好调整标签的大小，1为一个数值单位，要求调整后的数值为整数。** 
##### 2.5.4子组标签标题大小
**滑动"SubgroupLabels size"用户可根据自己的喜好调整标签的大小，1为一个数值单位，要求调整后的数值为整数。** 

### **2.6 图的类型--"Advanced interactive treemap"**

**用户在Plot type 这个功能部件中选择"Advanced interactive treemap"时可以额外对以下功能部件做出修改。**
##### 2.6.1 图例大小
**"Color value"可以使用户实现根据自己上传数据内容命名图例。** 

### **2.7 图的类型--"Interactive treemap"**

**用户在Plot type 这个功能部件中选择"Interactive treemap"时可以得到一个交互式的Treemap图。**

# **3. Triple Treemap**

#### 3.1 "Data type"这个功能插件可以让用户选择输入数据中包含的变量数量，支持包含一种或者两种变量的数据，用户可根据需求选择上传文件或是粘贴数据，用户可先点击Upload input data选择上传文件，再点击Browse上传本地数据；用户如果想要了解数据格式和画出的图形效果，可以先点击Download example data下载样本文档，再点击Browse上传样本数据。用户也可以点击Paste input data来选择粘贴上传数据，此时文本框中就会出现样本数据，数据的格式应符合下列要求。

 - **当输入数据只有一种变量时数据应只有四列。**
 - **第一列**: **数据分组。**
 - **第二列**: **数据子组。**
 - **第三列**: **数据子组的分组。**
 - **第四列**: **最小一级分组对应的一种变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	ShenZhen	NanShan	 3650.61
GuangDong	ShenZhen	FuTian	 2488.37
GuangDong	ShenZhen	LongGang 2128.60
GuangDong	ShenZhen	BaoAn	 2077.00
GuangDong	ShenZhen	LongHua	 1195.53
```
 - **当输入数据包含两种变量时数据应有五列。**
 - **第一列**: **数据分组。**
 - **第二列**: **数据子组。**
 - **第三列**: **数据子组的分组。**
 - **第四列**: **最小一级分组对应的一种变量大小。**

  

 - **第五列**: **最小一级分组对应的另一种变量大小。**

 

**数据的格式应该和下面一样。**  


```
GuangDong	ShenZhen	NanShan	 3650.61	154.58
GuangDong	ShenZhen	FuTian	 2488.37	166.29
GuangDong	ShenZhen	LongGang 2128.60	250.86
GuangDong	ShenZhen	BaoAn	 2077.00	334.25
GuangDong	ShenZhen	LongHua	 1195.53	170.63
```

### **3.2 点击Submit!运行这个shiny程序，进而出来用上传数据画出的treepmap图。**

### **3.3 图的类型**

**和Level Two Treemap 页面一样，用户可以在Plot type 这个功能部件中选择输出的Treemap类型，其中包括"Static treemap"(静态的treemap图)、"Interactive treemap"(交互式的treemap图)以及"Advanced interactive treemap"(高级交互的treemap图)。**

### **3.4 图的类型--"Static treemap"**

**用户在"Plot type" 这个功能部件中选择"Static treemap"时除了可以自定义调节图例大小、标题大小、分组的标签大小、子组的标签大小外还可以额外通过"Sub-subgroupLabels size" 这个功能插件对最小一级子组的标签大小做出修改。**


## **4.下载**
**在完成Treemap图编辑之后，可以将图下载到本地，本应用程序提供了两种下载文件，分别是pdf和svg文件格式，用户可根据喜好选择下载。**

