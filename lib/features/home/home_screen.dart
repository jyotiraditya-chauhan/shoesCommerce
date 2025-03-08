import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/core/app_constants.dart';
import 'package:shoes_app/core/data.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';
import 'package:shoes_app/features/home/widgets/custom_card.dart';
import 'package:shoes_app/features/home/widgets/new_arrivals_view.dart';
import 'package:shoes_app/features/home/widgets/shoes_banner_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? offset = 0.0;
  final double maxOffset = 767.0;
  final double minHeight = 60.0;
  final double maxHeight = 80.0;
  final double minWidth = 60.0;
  final double maxWidth = 80.0;

  final companiesList = [
    AppConstants.adidasLogo,
    AppConstants.pumaLogo,
    AppConstants.converseLogo,
    AppConstants.nikeLogo,
  ];

  TextEditingController searchController = TextEditingController();
  ScrollController? _scrollController;
  List<ShoesModel> filterModel = [];
  int selectedBrand = 0;

  void _scrollListener() {
    if (_scrollController != null) {
      offset = _scrollController!.offset;
      setState(() {});
    }
  }

  double getContainerHeight() {
    final screenHeight = MediaQuery.of(context).size.height;
    final oneThirdHeight = screenHeight / 3;
    return (offset! >= oneThirdHeight)
        ? 0.0
        : maxHeight -
            (maxHeight * (offset! / oneThirdHeight)).clamp(0.0, maxHeight);
  }

  double getImageWidth() {
    final screenHeight = MediaQuery.of(context).size.height;
    final oneThirdHeight = screenHeight / 3;
    return (offset! >= oneThirdHeight)
        ? minWidth
        : maxWidth - (maxWidth - minWidth) * (offset! / oneThirdHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
    filterModel.addAll(sampleShoeList);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: height * 0.22,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppConstants.appLogo,
                        height: 60,
                        width: 120,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Center(
                          child: Icon(
                            IconlyLight.heart,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          IconlyLight.search,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for your favorite shoes...",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                filterModel = sampleShoeList
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              } else {
                                filterModel.addAll(sampleShoeList);
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          searchController.text.isEmpty
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: getContainerHeight(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFEE78E),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: SizedBox(
                    width: width - width * 0.1,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: companiesList.length,
                      addAutomaticKeepAlives: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var data = companiesList[index];
                        return ShoesBannerComponentsView(
                          image: data,
                          isSelected: index == selectedBrand,
                          onTap: () {
                            setState(() {
                              selectedBrand = index;
                            });
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: searchController.text.isNotEmpty
                ? height * 0.65
                : getContainerHeight() == 0.0
                    ? height * 0.65
                    : height * 0.57,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  if (searchController.text.isEmpty)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Populer Shoes",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.playfair().fontFamily,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          )
                        ],
                      ),
                    ),
                  if (searchController.text.isEmpty)
                    SizedBox(
                      height: 250,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: sampleShoeList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: CustomCarrView(
                                model: sampleShoeList[index],
                                onTap: () {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .addShoes(sampleShoeList[index]);
                                  sampleShoeList.removeAt(index);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  SizedBox(height: 6),
                  if (searchController.text.isEmpty)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Arrivals",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.playfair().fontFamily,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchController.text = " ";
                              setState(() {});
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: filterModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: NewArrivalsView(
                          model: filterModel[index],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
