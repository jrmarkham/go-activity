import 'package:go_activity_app/src/data/models/activity.dart';

abstract class BaseActivityServices {
  List<ActivityModel> getActivities();
}

class ActivityServices extends BaseActivityServices {
  // static singleton
  static final ActivityServices _instance = ActivityServices.internal();

  factory ActivityServices() => _instance;

  ActivityServices.internal();

  List<ActivityModel> getActivities() {
    return [
      ActivityModel(
          id: 0,
          title: 'Let\'s Go to Egypt',
          date: 'October 25, 2007',
          location: 'Cairo, Egypt',
          description: 'Nearly 5,000 years ago, Memphis was the capital of Egypt and Giza served as the burial grounds for the royals. The three pyramid complexes were created in honor of their kings. The oldest of the Pyramids of Giza were built all the way back in 2613-2498 BC and there are so many different layers of meaning surrounding them.',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/egypt.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 1,
          title: 'School Halloween',
          date: 'October 31, 2019',
          location: 'Peck Slip, New York, NY USA',
          description: 'Peck Slip School Halloween Costume party!!\n'
    '\nHalloween or Halloween (a contraction of "All Hallows\' evening"), '
              'also known as Allhalloween, All Hallows\' Eve, or All Saints\''
    ' Eve, is a celebration observed in many countries on 31 October, the eve'
              ' of the Western Christian feast of All Hallows\' Day. It '
    'begins the observance of Allhallowtide, the time in the liturgical year '
              'dedicated to remembering the dead, including saints (hallows),'
              ' martyrs, and all the faithful departed. \n\n One theory holds'
              ' that many Halloween traditions may have been influenced by '
              'ancient Celtic harvest festivals, particularly the Gaelic '
              'festival Samhain, which may have had pagan roots; some scholars hold that Samhain may have been Christianized as All Hallow\'s Day, along with its eve, by the early Church. Other academics believe, however, that Halloween began solely as a Christian holiday, being the vigil of All Hallow\'s Day.\n\n Halloween activities include trick-or-treating (or the related guising and souling), attending Halloween costume parties, carving pumpkins into jack-o\'-lanterns, lighting bonfires, apple bobbing, divination games, playing pranks, visiting haunted attractions, telling scary stories, as well as watching horror films. In many parts of the world, the Christian religious observances of All Hallows\' Eve, including attending church services and lighting candles on the graves of the dead, remain popular, although elsewhere it is a more commercial and secular celebration. Some Christians historically abstained from meat on All Hallows\' Eve, a tradition reflected in the eating of certain vegetarian foods on this vigil day, including apples, potato pancakes, and soul cakes.',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/halloween.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 2,
          title: 'Greece See the Ancient World',
          date: 'September 20, 2009',
          location: 'location',
          description: 'Ancient Greek includes the forms of the Greek language used in ancient Greece and the ancient world from around 1500 BC to 300 BC. It is often roughly divided into the following periods: Mycenaean Greek (c. 1400–1200 BC), Dark Ages (c. 1200–800 BC), the Archaic period (c. 800–500 BC), and the Classical period (c. 500–300 BC).\n\nAncient Greek was the language of Homer and of fifth-century Athenian historians, playwrights, and philosophers. It has contributed many words to English vocabulary and has been a standard subject of study in educational institutions of the Western world since the Renaissance. This article primarily contains information about the Epic and Classical periods of the language.\n\n From the Hellenistic period (c. 300 BC), Ancient Greek was followed by Koine Greek, which is regarded as a separate historical stage, although its earliest form closely resembles Attic Greek and its latest form approaches Medieval Greek. There were several regional dialects of Ancient Greek, of which Attic Greek developed into Koine.',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/greece.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 3,
          title: 'Visit Moscow Russia',
          date: 'date',
          location: 'Moscow, Russia',
          description: 'The very founding site of the city (and arguably, the'
              ' country), the Kremlin and Red Square are still at the heart of Moscow – historically, geographically and spiritually. Feel the weight of this significance as you wander within the walls of the ancient fortress, marvel at the mind-boggling magnificence of St Basil\'s Cathedral and pay your respects to the revered leader of a now-defunct state. Moscow will move you. It will tantalise your senses, soothe your spirit and boggle your mind – and it all starts right here at the Kremlin and Red Square.',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/moscow.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 4,
          title: 'New Zealand, Hang out in a Hobbit Hole',
          date: 'November 12, 2006',
          location: 'New Zealand',
          description: 'Description of a Hobbit-hole. Hobbit-holes, otherwise called Smials, were the preferred dwellings of Hobbits in the Shire, the ancient mortal race inhabiting Middle-earth.',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/newzealand'
              '.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 5,
          title: 'See Sunny Spain',
          date: 'March 21, 2010',
          location: 'Madrid, Spain',
          description: 'In ancient times the Iberian Peninsula at the '
              'southwestern tip of Europe has been inhabited by various ethnic groups. Iberian tribes moved into the peninsula at some point during the second millennium B.C. --whether from north Africa or southern Europe-- and spread out over a broad area. During the eighth and ninth centuries B.C. Phoenicians, Greeks, Carthaginians, and a significant number of Celtic immigrants from central and northern Europe entered the peninsula. This highly diversified ethnic stocks of the pre-Roman period, constituting the ancestors of the later Spaniards. Disparate societies and the tribal organization of the Iberian inhabitants slow down the conquest of "Hispania" by the Romans, lasting from 218 B.C. to 19 B.C.\n\n With the decline of the Roman empire, Suebi, Vandals and Alans took control of parts of Hispania. They were followed by the Visigoths, who conquered all of Hispania in the 5th century AD and established a kingdom lasting until 711, when it fell to an invasion by Islamic North African Moors. The Reconquista, the battle between the Christian kingdoms and the Moors lasted until 1492, and in 1512 the unification of present-day Spain was completed. \n\nDuring the 16th century, Spain became the most powerful nation in Europe, due to the immense wealth derived from their possessions in the Americas. The steady decline of Spanish power in Europe began at the end of the 16th century, in the 19th century Spain suffered the loss of most of its colonies. \n\nAfter the victory of his nationalist forces in 1939, General Francisco Franco ruled a nation exhausted politically and economically, isolated by the Allies.\n\nIn 1955 Spain joined the United Nations. General Franco named Prince Juan Carlos in 1969 as Spain\'s next ruler, and in 1975, Juan Carlos assumed the position of king and head of state. \n\nSpain joined NATO in 1982 and became a member of the European Union in 1986. ',
          imageUrl: 'https://sandbox.markhamenterprises.com/go_app/spain.jpg',
          isUserActivity: false),
      ActivityModel(
          id: 6,
          title: 'Merry Ole England',
          date: 'September 12, 2002',
          location: 'Stone Henge England',
          description: 'Stonehenge is a prehistoric monument on Salisbury '
              'Plain in Wiltshire, England, two miles (3 km) west of Amesbury. It consists of an outer ring of vertical Sarsen standing stones, each around 13 feet (4.0 m) high, seven feet (2.1 m) wide, and weighing around 25 tons, topped by connecting horizontal lintel stones. Inside is a ring of smaller bluestones. Inside these are free-standing trilithons, two bulkier vertical Sarsens joined by one lintel. The whole monument, now ruinous, is oriented towards the sunrise on the summer solstice. The stones are set within earthworks in the middle of the most dense complex of Neolithic and Bronze Age monuments in England, including several hundred tumuli (burial mounds).\n\nArchaeologists believe it was constructed from 3000 BC to 2000 BC. The surrounding circular earth bank and ditch, which constitute the earliest phase of the monument, have been dated to about 3100 BC. Radiocarbon dating suggests that the first bluestones were raised between 2400 and 2200 BC, although they may have been at the site as early as 3000 BC.\n\nOne of the most famous landmarks in the United Kingdom, Stonehenge is regarded as a British cultural icon. It has been a legally protected Scheduled Ancient Monument since 1882, when legislation to protect historic monuments was first successfully introduced in Britain. The site and its surroundings were added to UNESCO\'s list of World Heritage Sites in 1986. Stonehenge is owned by the Crown and managed by English Heritage; the surrounding land is owned by the National Trust.\n\nStonehenge could have been a burial ground from its earliest beginnings. Deposits containing human bone date from as early as 3000 BC, when the ditch and bank were first dug, and continued for at least another 500 years.',
          imageUrl:'https://sandbox.markhamenterprises.com/go_app/england.jpg',
          isUserActivity: false)
    ];
  }
}
