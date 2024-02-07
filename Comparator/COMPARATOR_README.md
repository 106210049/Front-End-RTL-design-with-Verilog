 # Mạch so sanh hai số 8 bit 
  Để thiết kế mạch so sánh hai số 8 bit ta sẻ thiết kế mạch so sánh hai số 1 bít. 
  Dùng các phần tủ logic ta dễ dàng thiết kế được mạch so sánh 1 bít như trên. Tuy 
  nhiên mạch so sanh trên không thể phát triển để so sanh nhiều bit được. Muốn so 
  sanh hai số nhiều bit ta phải tuân theo trình tự so sánh từ bit cao nhất trước ( bit có 
  nhiều ý nghĩa nhất). Nếu số nào có bit cao lơn hơn thì số đó sẻ lơn hơn và kết thúc 
  việc so sánh, nêu hai bít có trong số cao nhất bằng nhau thì sẻ so sanh hai số có 
  trọng số thấp hơn, cứ như vậy cho đến bit thấp nhất, hai số bằng nhau nếu tất cả các 
  bít tưng ứng của hai số đều bằng nhau. Để so sánh hái số 8 bit ta phải thêm các bit 
  điều khiển vào mạch so sanh hai số một bit, gọi là mạch so sanh 1 bít đầy đủ. Ta có 
  sơ đồ khôi như sau:
  
<img src="Sơ đồ khối bộ so sánh 1 bit đầy đủ.png" width="200" >  

## Bảng trạng thái mô tả hoạt động bộ so sánh 1 bit như sau:

<img src="Bảng mô tả trạng thái.png" width="600" >  

<img src="Phương trình trạng thái bộ so sánh 2 bit đầy đủ.png" width="400" >  

## Sơ đồ mạch logic bộ so sánh 2 bit đầy đủ:

<img src="Sơ đồ mạch logic bộ so sánh 2bit đầy đủ.png" width="600" >  

## Sơ đồ khối bộ so sánh 1 bit đầy đủ như sau:

<img src="Sơ đồ khối bộ so sánh 1 bit đầy đủ.png" width="200" >  

Từ đó để có bộ so sánh 2 số 8 bit ta phải ghép 8 bọ so sánh 1 bit đầy đủ với nhau: 

<img src="Sơ đồ bộ so sánh hai số nhị phân 8 bit.png" width="700" >  
