# OCR IS COOL!

## Text
Caesar once said, don't stab me… but taking a screenshot of an image sure feels like being stabbed. You connected to a VNC server on the Foobanizer 9000, it was view only. This screenshot is all that was present but it's gibberish. Can you recover the original text?

## Attachments
An image is attached of an email with garbled text.

## Tools Used
* Tesseract OCR
* 

## Solution
The first step is to extract the text from the image. To do this, I used Tessearct OCR:
```
tesseract OCR_is_cool.png OCR_output
```

This provided me with a textfile (OCR_output.txt) with the following text within it:
```
a mum Eung‘eihmme

 

   

   

   

 

(- e D W « mall.google.(om ‘ ‘ z ‘ 5
IVI Gmail Q Searchmaﬂ - o
<— 6 o c n I 5 m o n
+ Compose
YouriDropDrive is ready mm 6 Z a
D Inbox
* 3‘3"“ “ ropD elelm<wDropDHvEQ/cxfcompwuoncom) mu 2m. gum {7 « 5 o
G Snuuzed mm“
Wxxkvnlmmxk
> Sent
. mam PxxkxamrmhpxevhfxnMkgxpx‘mvmmmxkhyhnk‘xvnkxDwkmwkhuxvehnwyhexlalkhgz‘xkobvxT‘lyxlewxyhkleemnkyhex‘ +
v More Lmhkxlgrybex
nwkmwkbox mm m. pbma 15 In hyykxxhgehgxhkhyyehgxlmhkux mmmgumpm ungkbxl \lbgmhgzl.yetzl.ybkﬁplkx\ uhmvhbg‘ pkhmxnlvxgrmabgz
o Wmlevmuled +
0.
Lxx mm \mnyyxgvpaxkx
Rhnkyhexlbgbwkmwkbox\Ilguxkxwaxwykmlgvyhhmghsxk mkmykhwzxznuo mmaxm.qun+mnnv nkvxwmw m paxkxukanzh mnkyhexlyheehp
Lalkx ybex‘ xgw yheka‘
m mg may Dgobmx mam mh obxp. whpgemw. lgw vheemhklmx hg xee max ybex‘ mn plgm um xkhe unmava cmm zbux max! max ebgd VMVMxnkvmaxkbmnu\mbmnmbhgvblaxk) xgw max! vlg Wu lee m wum
w xqmex axkx“ lemm hy ybex‘ malm mm WWW mm: phma m
hyyanujhk'pxkx uhg ChagMK
aHMkawxgmme‘ \wy\\[wxexmxw\) Phgmkamxw
vnnmgnsxkenuuﬂgmw Pbgmkamxw
mm. Mnkuh
ngvx px mmx mum oxkv \xkbhmev xgw Dg nkka um mm.“ mn my.“ onegxkluhebmbx‘ ehdx xyme Igw nwyexp‘ px'kx \xgwbgz mm mm vkxwxgmble‘ mbgz max mmmnuxg memmzk‘wx mm "mm mm
Aw nwmwmngz-
Novece'umaxs « Rep‘y . Forward

Stan a new one
```

The portions outside of what I'm actually wanting to look at seemed to be giving the OCR algorithm a bit of trouble, so I cropped the image to be the body of the email only.

Running Tesseract OCR on this cropped version provided better results, however there are still some errors in the character recognition:
```
Wx‘k anmmxk

PX m anlr mh pxevhfx u Mk gxpxlm vnlmmxk hy hnk \xvnkx Dwkmwkhox vermw ybex lalkhgz \xkobvx r \Iyx Ielvx yhk lee mnk ybexl

Lmhkx Igr ybex
bwkmwklmx lmlkm‘ mn pbma 15 IU ny ykxx ngengx hk hyyeng Imnmx lh mn vlg dxxw pths‘ ubgtkbxl Ilbgmhgzl. yelzl. ybkﬁplkx‘ uhmvhbgl‘ pkhmxnl

   

tgrmabgz

Lxx mnk lmnyy lgvpaxkx
Rhnk yhexl Dg bwkmwklmx mg ux kxlvaxw yth lg! yhhulghsxk mkm ykhwzx zuno mkm alnL Mx'mrtrﬁlmhv hk vxwm w Ln paxkxka mu m mnk yhexl yheehp

Lalkx ybex‘ tgw yhekal
Rhn mg jnhvder Dgabmx hmaxkl mh abxp. wnpgemw. lgw vheeluhklmx hg tee max ybex‘ mn plgm um xme mmwavxgml Cnlm zbux max! max 2179:! vmvmnwmaxknmnmmnmnmnngvmaxk) tgw maxv mg lwa lee mnk wum

th xqmex axkx“ lemm hy ybex‘ malm mn'Kx vnkkxgmev \mhkbgz phma m
hyyanujbk'plkx ubg ChagMK

aHMguwxgmmel \wy\ \(wxexmxw\) pngmkamxw
vnnmgnsxkaunnfugmem Pbgmkamxw

yvm mm Mnkuh

ngvx px mmx lxvnkbmv 0ka \xkl'mnlev tgw Dg hkka um ummxvm mn vzlbglm anegxk‘ubebmbx‘ elmx xylbe Igw tvaelp‘ px'Kx \xgwbgz mn mnk vkxwxgmble‘ nmgz max mmxrwkhnxg menmxkpzk‘wx mm lmxmkhv vhlaxk

Aw bwkmwkbabgz'
```

Looking at [Tesseract OCR's wiki](https://github.com/tesseract-ocr/tesseract/wiki/ImproveQuality#rescaling), it appears that Tessearct OCR works best with images with a DPI of at least 300 dpi.
