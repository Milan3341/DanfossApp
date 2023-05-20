class DataModel {
  final String title;
  final String imageName;
  final String description;
  DataModel(
    this.title,
    this.imageName,
    this.description,
  );
}

List<DataModel> dataList = [
  DataModel("Chiller Analysis", "assets/images/X-RayTurboTT.png",
      "This tool is a marketing tool that gives a ROI ( Return on investment ) based on a IPLV ( Integrated part load value ) for two water chillers with selected technologies."),
  DataModel("Hydronic Tool", "assets/images/PIBV.png",
      "This tool gives a visual display of performance when using pressure independent balancing valves combined with variable speed drives."),
  DataModel("Value Tool", "assets/images/Arrowup.png",
      "This tool will help navigate and explain some of the some of the assumption in the ROI tool. For example.. plant efficiency, IPLV etc."),
];
