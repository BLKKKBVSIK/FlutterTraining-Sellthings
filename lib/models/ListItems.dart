import 'package:bvsik/models/ItemModel.dart';

List<ItemModel> it = <ItemModel>[
  gnome,
  surface,
  bicycle,
  bose,
  fridge,
  gear,
  gearVr,
  guitar,
  iphoneX,
  piano,
  playstation,
  tablet
];

ItemModel gnome = ItemModel(
    images: <String>[
      'https://commentseruiner.com/32058-large_default/nain-de-jardin-i-m-sexy.jpg',
    ],
    name: 'Nain de jardin',
    price: '18.50',
    description: 'Ce nain de jardin est incroyable, encore plus beau en vrai',
    date: '2020-02-13T09:00:00Z',
    shippingFees: '3.24',
    author: 'Mike Lesgy',
    state: 'Bon état');

ItemModel surface = ItemModel(
    images: <String>[
      'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/10/microsoft-surface-laptop-3-big__w770.jpg',
    ],
    name: 'Surface 3',
    price: '680',
    description: 'PC portable très peu utilisé',
    date: '2020-02-13T09:00:00Z',
    shippingFees: '3.24',
    author: 'Gille Lafou',
    state: 'Comme neuf');

ItemModel playstation = ItemModel(
    images: <String>[
      'https://pic.clubic.com/v1/images/1711918/raw?width=1200&fit=max&hash=a7b5869dac0c9590341c92ee4dd0108c30e25916',
      'https://cdn.eglobalcentral.fr/images/detailed/79/sony-playstation-4-ps4-slim-1tb-with-1pc-yibkt2-3.jpg'
    ],
    name: 'Playstation 4',
    price: '230',
    description: 'PS4 comme neuve fonctionne parfaitement',
    date: '2020-02-15T19:10:00Z',
    shippingFees: '6.00',
    author: 'Arthur kefa',
    state: 'Comme neuf');

ItemModel iphoneX = ItemModel(
    images: <String>[
      'https://media.paruvendu.fr/image/iphone-noir/WB15/7/9/WB157969024_1.jpeg'
    ],
    name: 'Iphone X - 256 Go',
    price: '750',
    description: 'Iphone X qui fonctionne parfaitement. Quelles traces de rayures.',
    date: '2020-04-02T13:17:00Z',
    shippingFees: '4.00',
    author: 'Lucie Pul',
    state: 'Bon état');

ItemModel bicycle = ItemModel(
    images: <String>[
      'https://media.intersport.fr/is/image/intersportfr/55550__AKU_Q1?\$produit_l\$&\$product_grey\$',
      'https://intersportfr.scene7.com/is/image/intersportfr/55550-1AKU_D1?\$produit_l\$&\$product_grey\$'
    ],
    name: 'Vélo appartement - Cv 550 care',
    price: '199',
    description: 'Voici un vélo d\'appartement pour effectuer votre sport à domicile',
    date: '2020-02-15T19:10:00Z',
    shippingFees: '6.00',
    author: 'Paul Velo',
    state: 'Comme neuf');

ItemModel piano = ItemModel(
    images: <String>[
      'https://www.thomann.de/pics/bdb/359614/9910221_800.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61Z77pXWMlL._AC_SL1500_.jpg'
    ],
    name: 'Yamaha P45',
    price: '100',
    description: 'Piano numérique de chez Yamaha. Une touche est cassé et ne fonctionne plus.',
    date: '2020-03-26-15T18:30:00Z',
    shippingFees: '6.00',
    author: 'Robert Terme',
    state: 'Abimé');

ItemModel tablet = ItemModel(
    images: <String>[
      'https://www.grosbill.com/images.grosbill.com/imagesproduitnew/imagesgallery/BIG/204551.jpg',
      'https://static.fnac-static.com/multimedia/Images/FR/NR/53/c9/51/5359955/1540-1/tsp20191022153220/Tablette-graphique-Wacom-Intuos-Pro-Small.jpg',
      'https://boulanger.scene7.com/is/image/Boulanger/bfr_overlay?layer=comp&\$t1=&\$product_id=Boulanger/4949268620062_h_f_l_0&wid=350&hei=350'
    ],
    name: 'Tablette Wacom Intuos',
    price: '39',
    description: 'Tablette Graphique en excellent état. Utile pour du graphisme.',
    date: '2020-03-29-15T13:23:00Z',
    shippingFees: '2.99',
    author: 'Julien Graphiste',
    state: 'Comme neuf');

ItemModel gearVr = ItemModel(
    images: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/619VY7CqqkL._AC_SL1500_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61KMoivIjcL._AC_SX466_.jpg'
    ],
    name: 'Samsung Gear VR',
    price: '25',
    description: 'Excellent casque pour débuter en VR. Excellent état',
    date: '2020-04-12-15T13:23:00Z',
    shippingFees: '3.50',
    author: 'Romain Gemvr',
    state: 'Comme neuf');

ItemModel fridge = ItemModel(
    images: <String>[
      'https://image.darty.com/gros_electromenager/refrigerateur-refrigerateur/refrigerateur_armoire/smeg_fab28rrd3_t1810014613830A_124134683.jpg',
      'https://image.darty.com/gros_electromenager/refrigerateur-refrigerateur/refrigerateur_armoire/smeg_fab28rrd3_l1810014613830B_124131810.jpg'
    ],
    name: 'Réfrigirateur SMEG FAB28RRD3',
    price: '399',
    description: 'Réfrigirateur avec 1 porte. Problème avec le congélateur qui ne fonctionne plus.',
    date: '2020-04-16-15T11:11:00Z',
    shippingFees: '6.99',
    author: 'Louis Frigo',
    state: 'Abimé');

ItemModel guitar = ItemModel(
    images: <String>[
      'https://media.paruvendu.fr/image/guitare-yamaha/WB15/4/4/WB154468386_1.jpeg'
    ],
    name: 'Guitare - Yamaha C70',
    price: '69',
    description: 'Super guitare. Les cordes viennent d\'être changées.',
    date: '2020-04-20-15T19:39:00Z',
    shippingFees: '3.99',
    author: 'Arthur Guitariste',
    state: 'Comme neuf');

ItemModel bose = ItemModel(
    images: <String>[
      'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2015/10/bose-soundlink-ii-3.jpg',
      'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2015/10/bose-soundlink-ii-1.jpg'
    ],
    name: 'Bose Soundlink 2',
    price: '149',
    description: 'Casque avec réduction de bruit. Excellent état',
    date: '2020-04-28-15T19:54:00Z',
    shippingFees: '3.99',
    author: 'Nicolas Musique',
    state: 'Comme neuf');

ItemModel gear = ItemModel(
    images: <String>[
      'https://img.phonandroid.com/2016/08/samsung-gear-s3-prise-enmain.jpg'
    ],
    name: 'Samsung Gear S3',
    price: '99',
    description: 'Montre connectée Samsung. Aucune rayures et parfaitement fonctionnelle',
    date: '2020-03-12-15T18:59:00Z',
    shippingFees: '3.99',
    author: 'Matthieu Watch',
    state: 'Comme neuf');