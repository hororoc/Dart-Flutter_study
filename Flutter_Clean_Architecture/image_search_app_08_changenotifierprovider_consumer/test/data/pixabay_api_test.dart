import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/data/pixabay_api.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('Pixabay data를 잘 가져와야 함.', () async {
    final api = PixabayApi();

    final client = MockClient();
    String query = 'iphone';

    when(client.get(Uri.parse(
            '${PixabayApi.baseURL}?key=${PixabayApi.key}&q=$query&image_type=photo')))
        .thenAnswer((_) async => http.Response(fakeJonBody, 200));

    final result = await api.fetch('iphone', client: client);

    expect(result.first.id, 410311);
    expect(result.length, 20);

    verify(client.get(Uri.parse(
        '${PixabayApi.baseURL}?key=${PixabayApi.key}&q=$query&image_type=photo')));
  });
}

// -> `flutter pub run build_runner build`

String fakeJonBody = """
{"total":8647,"totalHits":500,"hits":[{"id":410311,"pageURL":"https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/","type":"photo","tags":"iphone, hand, screen","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g2c8a231cb7e82b42e1a5d2860553fa8d645f6785a31233c5da9db0ab03a7c542b99466a76463815ed611b4d2ee4b6fe6_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g679ce0c9c91f28d8cf56dc1a03997792ec7a529ca04d3b57706308d96ac41305f6cb4cc73a3ab7ebaa6a004331a41393c9d92fcf3b24569dc6ec28ab7fc6850a_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":416413,"views":486622,"downloads":238688,"collections":5545,"likes":579,"comments":159,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":410324,"pageURL":"https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/","type":"photo","tags":"iphone, smartphone, apps","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g98d14fdd101873422d42a25b0d5a20ec8bc2e551031e82eef7e0db0fc728d6fe8a3010e5c9118bb670ad45ed75360be4_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/ge2a76979eac15e738da2e5837207c5d420c0ed8a749db9e7103df98a765b8b8e9d1a2a637605f6268a856a44c515897a6c6cbc3542328ffb1fd0e5636dcd03fd_1280.jpg","imageWidth":2180,"imageHeight":1453,"imageSize":477025,"views":638749,"downloads":358874,"collections":6604,"likes":754,"comments":194,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":2846221,"pageURL":"https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/","type":"photo","tags":"business, computer, mobile","previewURL":"https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gc763b1b187dfda1b9b4d91c7cc165e387a760070328862547f2fa478f3f539b93459e6424cc5c2130ab115dee008a80ed1e72b276e955a3908b78268762fda6b_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/ga346067d700f7a1b0efaaaa406cdd0b142f28bb55a659d383cc3d3709d3588207565d9832e17a5513ff5acb4692527b3c1f42dad8573b5fda02e9920ad866eee_1280.jpg","imageWidth":4608,"imageHeight":3072,"imageSize":2543501,"views":352607,"downloads":250538,"collections":3870,"likes":593,"comments":86,"user_id":6689062,"user":"6689062","userImageURL":""},{"id":1867461,"pageURL":"https://pixabay.com/photos/apple-iphone-close-up-smartphone-1867461/","type":"photo","tags":"apple, iphone, close up","previewURL":"https://cdn.pixabay.com/photo/2016/11/29/05/08/apple-1867461_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/g1f3b0aed2ca1c6f24246fcc8656342c4a9f398a2f28b72e4f543cbba6627153a5989477477f2800565fe4dbb118e009db677b0bb811c49b3e9ac38c9ab0db2aa_640.jpg","webformatWidth":640,"webformatHeight":427,"largeImageURL":"https://pixabay.com/get/ge5fd88762ea732b190ce08887c64bb607e6a139d4826ae79b476a855b077641ed10f024e7494ff9c032774da1169e05e90f53d2f1765c5df0031196f1d994e67_1280.jpg","imageWidth":5252,"imageHeight":3507,"imageSize":1410507,"views":61036,"downloads":35745,"collections":1296,"likes":119,"comments":18,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":620817,"pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/","type":"photo","tags":"office, notes, notepad","previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g048d1882aa35741fec1f1d62ab538cf01e2fe999c15db30e60215f7336ac7e3b4988561b980f71df8d3ddc1d35cb27e3_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/gcff7721b258cfa5a390c162b6fa84487c1649516e39dbd5c9d5a597a8c5059ee3e075ca4758f2b6f48869113218a016f585e7112fd3b66c90022fab4dc5b7d69_1280.jpg","imageWidth":4288,"imageHeight":2848,"imageSize":2800224,"views":675141,"downloads":290666,"collections":5391,"likes":1063,"comments":248,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":4106766,"pageURL":"https://pixabay.com/photos/astronaut-moon-space-nasa-planet-4106766/","type":"photo","tags":"astronaut, moon, space","previewURL":"https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gb2ef6ac266f871c303d4f91a145976800d8303194f22b8c848d598d341ba0ff061da082156b1e6e293599747af909c9118bbbb6e96d060631f834031acae83bc_640.jpg","webformatWidth":426,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gb7ddc54671b938189d395f443c24a53f271720db1c544070850cdb1bd90b5bd124d49cd68b5ccf047b4ec6e50e39668a6555fbd9f62cabcd29c9d95bd5d0a801_1280.jpg","imageWidth":4000,"imageHeight":6000,"imageSize":2047424,"views":514496,"downloads":386564,"collections":8146,"likes":972,"comments":102,"user_id":12044322,"user":"pizar_kestrap","userImageURL":""},{"id":5537230,"pageURL":"https://pixabay.com/photos/iphone-hand-phone-mobile-phone-5537230/","type":"photo","tags":"iphone, hand, phone","previewURL":"https://cdn.pixabay.com/photo/2020/09/02/03/26/iphone-5537230_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/g9c983d2c4a59ce3751b23d174940cbd0cefed4fb3a858d3203ced0748b75ecc5e97127872b2443e193a3403316987cf988aef92ff2b137e16b508a15e15fee2d_640.jpg","webformatWidth":640,"webformatHeight":427,"largeImageURL":"https://pixabay.com/get/gcee70fe4576a107b0068bb8255de9e35115585e900284c60da3a0b0ce56d50422175148a67911ddac77e0224efccdae65a745ca2a867f49d47a256816fbd45a6_1280.jpg","imageWidth":6000,"imageHeight":4000,"imageSize":2408760,"views":56498,"downloads":34480,"collections":1669,"likes":82,"comments":11,"user_id":498081,"user":"tranmautritam","userImageURL":"https://cdn.pixabay.com/user/2015/01/22/05-13-32-817_250x250.jpg"},{"id":1192032,"pageURL":"https://pixabay.com/photos/girl-smartphone-iphone-1192032/","type":"photo","tags":"girl, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2016/02/10/16/39/girl-1192032_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g79edd3b73f4e14de362119d03c6400b1b98f9b99616f3a7ccc4f759806c9a9de4141f415deb1a0414c2d5a03567eda43c639dae8d536fba9e5aabb90e57a6fcc_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/ge995dbe672c008d27a699097d8f3004211a225152ea66f9229c352accdf330787f0297424e702b20111b5e20409d524ed83de4cb2bc505691d71b197e38a510d_1280.jpg","imageWidth":2048,"imageHeight":1367,"imageSize":299773,"views":98425,"downloads":47062,"collections":782,"likes":184,"comments":16,"user_id":725943,"user":"janeb13","userImageURL":"https://cdn.pixabay.com/user/2016/02/25/23-52-46-967_250x250.jpg"},{"id":2681039,"pageURL":"https://pixabay.com/photos/watercolor-painting-colorful-art-2681039/","type":"photo","tags":"watercolor, painting, colorful","previewURL":"https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g4537947f1ff9cc7b11e0e4aa529940cd448a17dacc4ea1af442fcc746dc7cf429f0e75ba6207c42a01110e11d92c84f18428a6cee58326a9959c6acf75e4237f_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g4b45578b88362b16b416d844da33c6ce8163f4a3160710dd66bd939dbe2ebf5a6cee3a65b6461976846e0f0eb5274a2cc332ef026bb95374ab98ad2ce2168363_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":5021313,"views":842655,"downloads":643803,"collections":6663,"likes":1099,"comments":109,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":459196,"pageURL":"https://pixabay.com/photos/macbook-laptop-google-display-459196/","type":"photo","tags":"macbook, laptop, google","previewURL":"https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg","previewWidth":150,"previewHeight":92,"webformatURL":"https://pixabay.com/get/g7f27941e9bff60b330ac3bb4c6d217d58f05a133dba7f93fb0be6742597e5e8f48281f2bd3382b233353841b73849b9e_640.jpg","webformatWidth":640,"webformatHeight":396,"largeImageURL":"https://pixabay.com/get/gdddd996a7d78e114f1bc2d4ce868282420c9e9139583229516734c097e3943dc70cc3f70dd993edf1d4a74771f02cf23671e071a12abbb676e7abf822adf0a83_1280.jpg","imageWidth":3888,"imageHeight":2406,"imageSize":2883743,"views":506432,"downloads":250981,"collections":5558,"likes":704,"comments":198,"user_id":377053,"user":"377053","userImageURL":""},{"id":3113279,"pageURL":"https://pixabay.com/photos/internet-whatsapp-smartphone-3113279/","type":"photo","tags":"internet, whatsapp, smartphone","previewURL":"https://cdn.pixabay.com/photo/2018/01/28/10/59/internet-3113279_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g0126f0af73915c90d42353041db3f451eaea4bc0ca79d95a92e444f4f0cdd00e95cee72d0908180b06eefbff1f504d90e6f409d0bfd9fe61d225474910c8dc01_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g558b2f7009a05c38e1e4d8629b50671efe078cd856ae6413695118bd975017a7e8105034dbac509c47fd216bd333ad03cff7e1f7ad0f941190281360c073c1af_1280.jpg","imageWidth":5616,"imageHeight":3744,"imageSize":2904510,"views":228021,"downloads":133123,"collections":3499,"likes":373,"comments":74,"user_id":13838,"user":"LoboStudioHamburg","userImageURL":"https://cdn.pixabay.com/user/2012/11/18/16-48-54-297_250x250.jpg"},{"id":763731,"pageURL":"https://pixabay.com/photos/social-media-facebook-smartphone-763731/","type":"photo","tags":"social media, facebook, smartphone","previewURL":"https://cdn.pixabay.com/photo/2015/05/12/09/13/social-media-763731_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g17ccb9da40da3c285140665543952b4b689b64fd11e2c1fe89d331c6a6af1ee8cae65379c5d80fc16803b24227d159ef_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/gda88c9b210e21173c2a190e7a6ee242aff8c551ef4acd275cff6de69807a6221abd40b307f75eb6822de7333a23354245e5451d188b9bbd6be4f142943e4507f_1280.jpg","imageWidth":3967,"imageHeight":2635,"imageSize":2511740,"views":215850,"downloads":126114,"collections":2788,"likes":407,"comments":92,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":1979674,"pageURL":"https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/","type":"photo","tags":"relaxing, lounging, saturday","previewURL":"https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg","previewWidth":150,"previewHeight":102,"webformatURL":"https://pixabay.com/get/gb6bd499121369163eb2a68b878847811d63841d25491882e40801db04cd91b9bc4de87dff4912603bdf13ca16ebac9f5645395456f3ef75560a5cf0a88c2b6d3_640.jpg","webformatWidth":640,"webformatHeight":438,"largeImageURL":"https://pixabay.com/get/g75693f3d0694e75c0b44383b5bedee11f2992bbd7603884040a8d2a35349754341cf13188e79ae9fd1e9f8698391fd2b3bae9670148e94cfbefc28fe9f71595b_1280.jpg","imageWidth":5310,"imageHeight":3637,"imageSize":3751070,"views":373402,"downloads":214517,"collections":4143,"likes":1108,"comments":138,"user_id":334088,"user":"JillWellington","userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"},{"id":1841553,"pageURL":"https://pixabay.com/photos/apple-iphone-notebook-pen-1841553/","type":"photo","tags":"apple, iphone, notebook","previewURL":"https://cdn.pixabay.com/photo/2016/11/19/22/53/apple-1841553_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g5add4dcdd69df0112a5ea90c3cf9b7c353685d20c8bfcf7805e7e8cf27401f5a59c689ce84458aa912a7d82ebcf4ed52701861b1beed2d8a820b7728545f7c72_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g83083f83a839381ae5bfa147c9d2757e50574d4ceb128b195a1afc94d1bad4c3d98f8bfabae682c4f2cc8cfd8395985ade1ffe122c66b96d783a9446dc360328_1280.jpg","imageWidth":3733,"imageHeight":2489,"imageSize":3052025,"views":76717,"downloads":48888,"collections":1405,"likes":182,"comments":23,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":3076954,"pageURL":"https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/","type":"photo","tags":"desk, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g0d515eb1f87465f9053d0b8436338fe2f891bca976bb9169692609f1951ec6ecda04ea7ed0aff660fc0f5807394f5420986c500feaa06fe5e9787e422e77fc3b_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gb7a15159b542d483165c5cf202a615fbb35e12fc311e2447090a738189f1bb881ce227a3bbe76576d4c537b2fd8c4f97568b68973ce02419594c211869f53c34_1280.jpg","imageWidth":5304,"imageHeight":3531,"imageSize":2258922,"views":215731,"downloads":137406,"collections":3353,"likes":533,"comments":98,"user_id":2218222,"user":"Ylanite","userImageURL":"https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"},{"id":6588614,"pageURL":"https://pixabay.com/photos/woman-butterflies-fashion-people-6588614/","type":"photo","tags":"woman, butterflies, fashion","previewURL":"https://cdn.pixabay.com/photo/2021/08/31/11/58/woman-6588614_150.jpg","previewWidth":106,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gc319ee4bb7de95443d79f26b51a9c52363bac1da78b24bc8905d0e9f473fb9785a802e2722a1910b5c9e90adad70a6e5a22359f3067b84157f3b71561d862da5_640.jpg","webformatWidth":453,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g714cff5fe5060b0b58a31f53cb582a4bee1ca725e3614b66efc0644d85d5b2598babee06aaf227e511ccfc60d95cf2997a9d8e7ac88a0f90707ce4fafb93e2ca_1280.jpg","imageWidth":4000,"imageHeight":5645,"imageSize":3056377,"views":162306,"downloads":141167,"collections":3341,"likes":213,"comments":25,"user_id":23172418,"user":"Wangphan","userImageURL":"https://cdn.pixabay.com/user/2021/08/31/11-28-28-241_250x250.jpg"},{"id":586266,"pageURL":"https://pixabay.com/photos/telephone-mobile-call-samsung-586266/","type":"photo","tags":"telephone, mobile, call","previewURL":"https://cdn.pixabay.com/photo/2015/01/01/23/55/telephone-586266_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g153b87b71ce9c6cab7dea52160f57fc2d0421aefbecdfcf2cb41725a91106e5105e858d754491b1114c9dd95041c99f7_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/ga83b4f02bc62efae2aaf511e265896a9b78703b2b34d67394f4216435e67bcff742a5a04297b44f231015f4da9a205c54535bdf88e61b765c58ae17858206965_1280.jpg","imageWidth":4936,"imageHeight":3291,"imageSize":2752598,"views":224679,"downloads":139082,"collections":2462,"likes":305,"comments":73,"user_id":80788,"user":"niekverlaan","userImageURL":"https://cdn.pixabay.com/user/2014/05/19/00-26-35-848_250x250.jpg"},{"id":1599527,"pageURL":"https://pixabay.com/photos/mystery-island-dinosaur-skull-1599527/","type":"photo","tags":"mystery, island, dinosaur","previewURL":"https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg","previewWidth":116,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g01025357bd992810ce8bceac55cac3c7eb54a07bacc495bbb2d26467ee3a3d0f4ed42ddd93b71955097e155a795730f4d9435a926aa429500d78fc23c8d36058_640.jpg","webformatWidth":495,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g21c368b18d23f35e2138796c1cbcd29ae47295c3f16d64fd0e04385fa5f2b683a89ab8e75f853df177fa8c36d8c4392b52529dcf7aad1630f186f73298cc4205_1280.jpg","imageWidth":3022,"imageHeight":3907,"imageSize":3563541,"views":576747,"downloads":288078,"collections":4085,"likes":1258,"comments":151,"user_id":2633886,"user":"intographics","userImageURL":"https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"},{"id":2369664,"pageURL":"https://pixabay.com/photos/art-multicoloured-to-dye-abstract-2369664/","type":"photo","tags":"art, multicoloured, to dye","previewURL":"https://cdn.pixabay.com/photo/2017/06/03/20/12/art-2369664_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g3244b39bd13805e5bd484044127fe1a727b52c08bfce49c8f875519bc9eefae7f8c1a32a8f38844fd62187b18a9b6f964606103e9d2b71b31fee095bee4597c4_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/ga936a207d36e707932e4f79c3d7a71c9e6b122b828a26ecac815eb679cb2d1ae1d6f0039088dcaa51d9d03a252018595e1019270f08a1bf2268b0ff2c7d98d91_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":4032363,"views":380923,"downloads":336567,"collections":3510,"likes":521,"comments":60,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":5987093,"pageURL":"https://pixabay.com/photos/laptop-mobile-phone-table-phone-5987093/","type":"photo","tags":"laptop, mobile phone, table","previewURL":"https://cdn.pixabay.com/photo/2021/02/06/07/02/laptop-5987093_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/gee0d73d75c32902be6190797f4d0f6ef1d93db6d754946bdc5625bfb41b8f921a5f0be64bc7b857f1c55414c05298d344955050d375c9a17e0a27f245ea7801d_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g3106a0edcc67ed0998547e585ed191041028a035bc28486d784ea24d3de87702eb61cdb307587003d249daf30967ee0990e791e31338360adb5315edfdc0c5a7_1280.jpg","imageWidth":4029,"imageHeight":2681,"imageSize":2360293,"views":13242,"downloads":7925,"collections":747,"likes":38,"comments":14,"user_id":5099306,"user":"kieutruongphoto","userImageURL":"https://cdn.pixabay.com/user/2021/09/03/12-10-14-149_250x250.jpg"}]}
""";
