import 'package:flutter/material.dart';
import 'package:video_meet/model/model_class.dart';

class  Home_Provider extends ChangeNotifier{
  int i=0;
  bool isplay = false ;


  void changeicon(int index){
    i = index;
    notifyListeners();
  }

  void playpause()
  {
    isplay=!isplay;
    notifyListeners();
  }
  List <Model>l1 = [
    Model(con: "Afghanistan	",km: "0.4km",year: "19",TImage: "assets/image/Image.png",Image2: "assets/image/p50.png",flag: "🇦🇫",Image: "assets/image/p1.png",centry:  "21,Afghanistan",like:"5.6" , Name: "Anastasia" ,video: "assets/video/1.mp4 "),
    Model(con: "Albania",km: "1.5km",year: "22",TImage: "assets/image/Image-1.png",Image2: "assets/image/p49.png",flag: "🇦🇽",Image: "assets/image/p2.png",centry:  "23,Albania",like:"7.8"   , Name: "Angelina " ,video: "assets/video/        2.mp4 "),
    Model(con: "Algeria	",km: "2.0km",year: "20",TImage: "assets/image/Image-2.png",Image2: "assets/image/p48.png",flag: "🇦🇱",Image: "assets/image/p3.png",centry:  "24,Algeria ",like:"8.5",   Name: "Annika " ,video: "assets/video/         3.mp4 "),
    Model(con: "Ando",km: "2.7km",year: "27",TImage: "assets/image/Image-3.png",Image2: "assets/image/p47.png",flag: "🇩🇿",Image: "assets/image/p4.png",centry:  "19,Andorra",like:"9.4",    Name: "Anya " ,video: "assets/video/               4.mp4 "),
    Model(con: "Angola	",km: "0.7km",year: "29",TImage: "assets/image/Image-4.png",Image2: "assets/image/p46.png",flag: "🇦🇸",Image: "assets/image/p5.png",centry:  "18,Angola",like:"5.2",     Name: "Irina " ,video: "assets/video/          5.mp4 "),
    Model(con: "Italy",km: "0.6km",year: "27",TImage: "assets/image/Image-5.png",Image2: "assets/image/p45.png",flag: "🇦🇩",Image: "assets/image/p6.png",centry:  "24,Madagascar",like:"12.5",Name: "Karine " ,video: "assets/video/            6.mp4 "),
    Model(con: "Argentina	",km: "0.9km",year: "28",TImage: "assets/image/Image-6.png",Image2: "assets/image/p44.png",flag: "🇦🇴",Image: "assets/image/p7.png",centry:  "18,Argentina",like:"18.5", Name: "Katina " ,video: "assets/video/       7.mp4 "),
    Model(con: "Armenia",km: "1.4km",year: "22",TImage: "assets/image/Image-7.png",Image2: "assets/image/p43.png",flag: "🇦🇮",Image: "assets/image/p8.png",centry:  "25,Armenia",like:"28.3",   Name: "Khristina " ,video: "assets/video/       8.mp4 "),
    Model(con: "Australia	",km: "1.0km",year: "19",TImage: "assets/image/Image-8.png",Image2: "assets/image/p42.png",flag: "🇦🇶",Image: "assets/image/p9.png",centry:  "9,Australia",like:"95.4",  Name: "Kira " ,video: "assets/video/         9.mp4 "),
    Model(con: "Austria",km: "2.9km",year: "20",TImage: "assets/image/p40.png",Image2: "assets/image/p41.png",flag: "🇦🇬",Image: "assets/image/p10.png",centry: "19,Austria",like:"55.1",        Name:"Lada ",video: "assets/video/             10.mp4 "),
    Model(con: "Azerbaijan	",km: "2.7km",year: "25",TImage: "assets/image/p41.png",Image2: "assets/image/p40.png",flag: "🇦🇷",Image: "assets/image/p11.png",centry: "22Malawi",like:"95.4",          Name:"Lara ",video: "assets/video/        11.mp4 "),
    Model(con: "Bahamas",km: "0.8km",year: "17",TImage: "assets/image/p42.png",Image2: "assets/image/p39.png",flag: "🇦🇲",Image: "assets/image/p12.png",centry: "20,Malaysia",like:"14.5",       Name:"Lelyah ",video: "assets/video/           12.mp4 "),
    Model(con: "Bahrain	",km: "6.7km",year: "24",TImage: "assets/image/p43.png",Image2: "assets/image/p38.png",flag: "🇦🇼",Image: "assets/image/p13.png",centry: "27,Maldives",like:"85.4"       ,Name:"Lia ",video: "assets/video/             13.mp4 "),
    Model(con: "Bangladesh",km: "4.8km",year: "25",TImage: "assets/image/p44.png",Image2: "assets/image/p37.png",flag: "🇦🇺",Image: "assets/image/p14.png",centry: "29,Mali",like:"94.5",           Name: "Mila ",video: "assets/video/         14.mp4 "),
    Model(con: "Barbad",km: "5.9km",year: "28",TImage: "assets/image/p45.png",Image2: "assets/image/p36.png",flag: "🇦🇹",Image: "assets/image/p15.png",centry: "27,Malta",like:"74.8",          Name: "Nadia ",video: "assets/video/              15.mp4  "),
    Model(con: "Belarus",km: "6.4km",year: "19",TImage: "assets/image/p46.png",Image2: "assets/image/p35.png",flag: "🇦🇿",Image: "assets/image/p16.png",centry: "28,Mexico",like:"25.6"         ,Name: "Natalya ",video: "assets/video/         16.mp4 "),
    Model(con: "Belgium	",km: "9.1km",year: "20",TImage: "assets/image/p47.png",Image2: "assets/image/p34.png",flag: "🇧🇸",Image: "assets/image/p17.png",centry: "22,Micronesia",like:"87.5",      Name: "Nina ",video: "assets/video/          17.mp4 "),
    Model(con: "Belize",km: "4.2km",year: "22",TImage: "assets/image/p48.png",Image2: "assets/image/p33.png",flag: "🇧🇭",Image: "assets/image/p18.png",centry: "19,Moldova",like:"35.4"         ,Name: "Anna ",video: "assets/video/            18.mp4 "),
    Model(con: "Benin	",km: "6.4km",year: "24",TImage: "assets/image/p49.png",Image2: "assets/image/p32.png",flag: "🇧🇩",Image: "assets/image/p19.png",centry: "20,Monaco",like:"15.4",          Name: "Anzhelika ",video: "assets/video/       19.mp4   "),
    Model(con: "Bhutan",km: "7.6km",year: "26",TImage: "assets/image/p50.png",Image2: "assets/image/p31.png",flag: "🇧🇧",Image: "assets/image/p20.png",centry: "25,Mongolia",like:"25.9",        Name: "Avdotya ",video: "assets/video/         20.mp4   "),
    Model(con: "Bolivia	",km: "9.4km",year: "28",TImage: "assets/image/p30.png",Image2: "assets/image/p30.png",flag: "🇧🇾",Image: "assets/image/p21.png",centry: "17,Chad",like:"19.6",            Name: "Bella ",video: "assets/video/         21.mp4   "),
    Model(con: "Latvia",km: "2.4km",year: "30",TImage: "assets/image/p31.png",Image2: "assets/image/p29.png",flag: "🇧🇪",Image: "assets/image/p22.png",centry: "24,Chile",like:"2.4",            Name: "Calina ",video: "assets/video/          22.mp4   "),
    Model(con: "Botswana",km: "6.4km",year: "17",TImage: "assets/image/p32.png",Image2: "assets/image/p28.png",flag: "🇧🇿",Image: "assets/image/p23.png",centry: "25,China",like:"6.4",            Name: "Dariya ",video: "assets/video/        23.mp4   "),
    Model(con: "Brazil",km: "6.1km",year: "19",TImage: "assets/image/p33.png",Image2: "assets/image/p27.png",flag: "🇧🇯",Image: "assets/image/p24.png",centry: "28,Colombia",like:"48.2",        Name: "Dasha ",video: "assets/video/           24.mp4   "),
    Model(con: "Brune",km: "0.4km",year: "21",TImage: "assets/image/p34.png",Image2: "assets/image/p26.png",flag: "🇧🇲",Image: "assets/image/p25.png",centry: "19,Comoros",like:"94.3",        Name: "Diana ",video: "assets/video/             25.mp4   "),
    Model(con: "Bulgaria,",km: "9.5km",year: "23",TImage: "assets/image/p35.png",Image2: "assets/image/p25.png",flag: "🇧🇹",Image: "assets/image/p26.png",centry: "20,Eritrea",like:"94.5",         Name: "Izabelle ",video: "assets/video/     26.mp4     "),
    Model(con: "Laos",km: "4.5km",year: "25",TImage: "assets/image/p36.png",Image2: "assets/image/p24.png",flag: "🇧🇴",Image: "assets/image/p27.png",centry: "22,Estonia",like:"64.2",         Name: "Mischa ",video: "assets/video/            27.mp4     "),
    Model(con: "Burundi	",km: "1.0km",year: "27",TImage: "assets/image/p37.png",Image2: "assets/image/p23.png",flag: "🇧🇦",Image: "assets/image/p28.png",centry: "24,Eswatini",like:"97.5",        Name: "Nadezhda ",video: "assets/video/      28.mp4       "),
    Model(con: "Israel	",km: "2.0km",year: "29",TImage: "assets/image/p38.png",Image2: "assets/image/p22.png",flag: "🇧🇼",Image: "assets/image/p29.png",centry: "26,Ethiopia",like:"99.4",        Name: "Ninotchka ",video: "assets/video/     29.mp4     "),
    Model(con: "Cabo Verde",km: "3.0km",year: "22",TImage: "assets/image/p39.png",Image2: "assets/image/p21.png",flag: "🇧🇷",Image: "assets/image/p30.png",centry: "28,Spain",like:"84.1",            Name: "Oksana ",video: "assets/video/     30.mp4     "),
    Model(con: "Cambodia",km: "7.5km",year: "29",TImage: "assets/image/p20.png",Image2: "assets/image/p20.png",flag: "🇻🇬",Image: "assets/image/p31.png",centry: "30,Sri Lanka",like:"45.1"        ,Name: "Ol'ga ",video: "assets/video/        31.mp4       "),
    Model(con: "Cameroon",km: "8.4km",year: "21",TImage: "assets/image/p21.png",Image2: "assets/image/p19.png",flag: "🇧🇳",Image: "assets/image/p32.png",centry: "17,Sudan",like:"99",              Name: "Olechka ",video: "assets/video/      32.mp4     "),
    Model(con: "Canada",km: "6.4km",year: "23",TImage: "assets/image/p22.png",Image2: "assets/image/p18.png",flag: "🇧🇬",Image: "assets/image/p33.png",centry: "19,Suriname",like:"45.1",         Name: "Olien ",video: "assets/video/          33.mp4     "),
    Model(con: "Niger",km: "4.1km",year: "22",TImage: "assets/image/p23.png",Image2: "assets/image/p17.png",flag: "🇧🇫",Image: "assets/image/p34.png",centry: "21,Sweden",like:"12",             Name: "Olya ",video: "assets/video/            34.mp4     "),
    Model(con: "Chad",km: "1.5km",year: "24",TImage: "assets/image/p24.png",Image2: "assets/image/p16.png",flag: "🇧🇮",Image: "assets/image/p35.png",centry: "23,Switzerland",like:"1.1",       Name: "Paraaha ",video: "assets/video/          35.mp4     "),
    Model(con: "Chile	",km: "6.1km",year: "18",TImage: "assets/image/p25.png",Image2: "assets/image/p15.png",flag: "🇰🇭",Image: "assets/image/p36.png",centry: "25,Syria",like:"6.4",             Name: "Pheodora ",video: "assets/video/       36.mp4     "),
    Model(con: "China	",km: "9.4km",year: "21",TImage: "assets/image/p26.png",Image2: "assets/image/p14.png",flag: "🇨🇲",Image: "assets/image/p37.png",centry: "27,Iceland",like:"8.4",           Name: "Polina ",video: "assets/video/         37.mp4     "),
    Model(con: "Colombia",km: "6.1km",year: "22",TImage: "assets/image/p27.png",Image2: "assets/image/p13.png",flag: "🇨🇦",Image: "assets/image/p38.png",centry: "29,India",like:"14.2",            Name: "Rada ",video: "assets/video/         38.mp4     "),
    Model(con: "Comoros",km: "7.2km",year: "23",TImage: "assets/image/p28.png",Image2: "assets/image/p12.png",flag: "🇮🇨",Image: "assets/image/p39.png",centry: "22Indonesia",like:"46.2",         Name: "Radinka ",video: "assets/video/       39.mp4       "),
    Model(con: "Congo ",km: "9.4km",year: "24",TImage: "assets/image/p29.png",Image2: "assets/image/p11.png",flag: "🇨🇻",Image: "assets/image/p40.png",centry: "29,Iran",like:"94.2",             Name: "Renata ",video: "assets/video/         40.mp4       "),
    Model(con: "Costa Rica",km: "6.1km",year: "25",TImage: "assets/image/p10.png",Image2: "assets/image/p10.png",flag: "🇧🇶",Image: "assets/image/p41.png",centry: "21,Iraq",like:"45.1",             Name: "Roksana",video: "assets/video/     41.mp4       "),
    Model(con: "Croatia",km: "7.4km",year: "21",TImage: "assets/image/p11.png",Image2: "assets/image/p9.png",flag: "🇰🇾",Image: "assets/image/p42.png",centry: "23,Ireland",like:"64.2",           Name: "Roza ",video: "assets/video/          42.mp4       "),
    Model(con: "Cuba	",km: "6.4km",year: "23",TImage: "assets/image/p12.png",Image2: "assets/image/p8.png",flag: "🇨🇫",Image: "assets/image/p43.png",centry: "22,Israel",like:"94.2",            Name: "Svetlana ",video: "assets/video/       43.mp4       "),
    Model(con: "Cyprus",km: "6.0km",year: "24",TImage: "assets/image/p13.png",Image2: "assets/image/p7.png",flag: "🇹🇩",Image: "assets/image/p44.png",centry: "24,Italy",like:"94.5",             Name: "Tavisha ",video: "assets/video/        44.mp4       "),
    Model(con: "Czechia ",km: "4.2km",year: "19",TImage: "assets/image/p14.png",Image2: "assets/image/p6.png",flag: "🇮🇴",Image: "assets/image/p45.png",centry: "18,Jamaica",like:"87.5",           Name: "Vanka ",video: "assets/video/        45.mp4       "),
    Model(con: "Democratic ",km: "3.1km",year: "18",TImage: "assets/image/p15.png",Image2: "assets/image/p5.png",flag: "🇨🇱",Image: "assets/image/p46.png",centry: "21,Japan",like:"94.5",             Name: "Zhanna ",video: "assets/video/    46.mp4       "),
    Model(con: "Denmark	",km: "3.9km",year: "24",TImage: "assets/image/p16.png",Image2: "assets/image/p4.png",flag: "🇨🇳",Image: "assets/image/p47.png",centry: "22,Jordan",like:"1",               Name: "Nika ",video: "assets/video/         47.mp4       "),
    Model(con: "Djibouti",km: "3.2km",year: "18",TImage: "assets/image/p17.png",Image2: "assets/image/p3.png",flag: "🇨🇽",Image: "assets/image/p48.png",centry: "23,Laos",like:"54",                Name: "Nikita ",video: "assets/video/       48.mp4       "),
    Model(con: "Iran",km: "4.2km",year: "25",TImage: "assets/image/p18.png",Image2: "assets/image/p2.png",flag: "🇨🇴",Image: "assets/image/p49.png",centry: "24,Latvia",like:"45.5",            Name: "Raisa ",video: "assets/video/            49.mp4       "),
    Model(con: "India",km: "8.4km",year: "19",TImage: "assets/image/p19.png",Image2: "assets/image/p1.png",flag: "🇫🇮",Image: "assets/image/p50.png",centry: "25,Lebanon",like:"34.1",            Name: "Regina ",video: "assets/video/           50.mp4       "),
  ];

  Model?Datapickkk;
}