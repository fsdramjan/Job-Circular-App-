class JobProfileData {
  static final genderList = ['Male', 'Female', 'Other'];
  static final religionList = [
    'Islam',
    'Hinduism',
    'Buddhism',
    'Christianity',
    'Other'
  ];
  static final martialStatus = [
    'Married',
    'Unmarried',
    'Divorce',
  ];
  static final quotaList = [
    'Physically Handicapped',
    'Children of Freedom Fighter',
    'Grand Children of Freedom Fighter',
    'Freedom Fighter',
    'Orphan',
    'Ethnic Minority',
    'Ansar-VDP',
    'None',
    'No',
  ];
  static final passingYearList = [];

  static getPassingYear() {
    passingYearList.clear();
    for (var i = 1900; i < 2024; i++) {
      passingYearList.add(i);
      // print("$i");
    }
  }

  static final boardList = [
    'Dhaka',
    'Cumilla',
    'Chittagong',
    'Barisal',
    'Dinajpur',
    'Jessore',
    'Mymensingh',
    'Rajshahi',
    'Sylhet',
  ];
  static final examination = [
    'JSC/Equivalent',
  ];

  static final jobType = [
    'Private',
    'Public',
  ];
}
