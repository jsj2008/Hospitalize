/**
 * Autogenerated by Thrift Compiler (0.9.3)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#import <Foundation/Foundation.h>

#import "TProtocol.h"
#import "TApplicationException.h"
#import "TProtocolException.h"
#import "TProtocolUtil.h"
#import "TProcessor.h"
#import "TObjective-C.h"
#import "TBase.h"
#import "TAsyncTransport.h"
#import "TProtocolFactory.h"
#import "TBaseClient.h"

#import "MtBase.h"

@interface NMTFBannersDto : NSObject <TBase, NSCoding> {
  int32_t __type;
  NSString * __bizId;
  NSString * __imgUrl;
  NSString * __link;

  BOOL __type_isset;
  BOOL __bizId_isset;
  BOOL __imgUrl_isset;
  BOOL __link_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=type, setter=setType:) int32_t type;
@property (nonatomic, retain, getter=bizId, setter=setBizId:) NSString * bizId;
@property (nonatomic, retain, getter=imgUrl, setter=setImgUrl:) NSString * imgUrl;
@property (nonatomic, retain, getter=link, setter=setLink:) NSString * link;
#endif

- (id) init;
- (id) initWithType: (int32_t) type bizId: (NSString *) bizId imgUrl: (NSString *) imgUrl link: (NSString *) link;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) type;
- (void) setType: (int32_t) type;
#endif
- (BOOL) typeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bizId;
- (void) setBizId: (NSString *) bizId;
#endif
- (BOOL) bizIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) imgUrl;
- (void) setImgUrl: (NSString *) imgUrl;
#endif
- (BOOL) imgUrlIsSet;

#if !__has_feature(objc_arc)
- (NSString *) link;
- (void) setLink: (NSString *) link;
#endif
- (BOOL) linkIsSet;

@end

@interface NMTFProCatDto : NSObject <TBase, NSCoding> {
  int32_t __catId;
  NSString * __name;

  BOOL __catId_isset;
  BOOL __name_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=catId, setter=setCatId:) int32_t catId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
#endif

- (id) init;
- (id) initWithCatId: (int32_t) catId name: (NSString *) name;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) catId;
- (void) setCatId: (int32_t) catId;
#endif
- (BOOL) catIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

@end

@interface NMTFMerDto : NSObject <TBase, NSCoding> {
  int64_t __merId;
  NSString * __name;
  NSString * __logo;
  NSString * __abbrName;
  NSString * __desc;
  NSString * __telephone;
  NSString * __serviceHotline;
  NSString * __licenseNumber;
  NSString * __businessLicense;
  NSString * __address;
  NSString * __tradeDsc;
  NSMutableArray * __backImgs;
  NSMutableArray * __papersImgs;
  int64_t __proCnt;

  BOOL __merId_isset;
  BOOL __name_isset;
  BOOL __logo_isset;
  BOOL __abbrName_isset;
  BOOL __desc_isset;
  BOOL __telephone_isset;
  BOOL __serviceHotline_isset;
  BOOL __licenseNumber_isset;
  BOOL __businessLicense_isset;
  BOOL __address_isset;
  BOOL __tradeDsc_isset;
  BOOL __backImgs_isset;
  BOOL __papersImgs_isset;
  BOOL __proCnt_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=logo, setter=setLogo:) NSString * logo;
@property (nonatomic, retain, getter=abbrName, setter=setAbbrName:) NSString * abbrName;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
@property (nonatomic, retain, getter=telephone, setter=setTelephone:) NSString * telephone;
@property (nonatomic, retain, getter=serviceHotline, setter=setServiceHotline:) NSString * serviceHotline;
@property (nonatomic, retain, getter=licenseNumber, setter=setLicenseNumber:) NSString * licenseNumber;
@property (nonatomic, retain, getter=businessLicense, setter=setBusinessLicense:) NSString * businessLicense;
@property (nonatomic, retain, getter=address, setter=setAddress:) NSString * address;
@property (nonatomic, retain, getter=tradeDsc, setter=setTradeDsc:) NSString * tradeDsc;
@property (nonatomic, retain, getter=backImgs, setter=setBackImgs:) NSMutableArray * backImgs;
@property (nonatomic, retain, getter=papersImgs, setter=setPapersImgs:) NSMutableArray * papersImgs;
@property (nonatomic, getter=proCnt, setter=setProCnt:) int64_t proCnt;
#endif

- (id) init;
- (id) initWithMerId: (int64_t) merId name: (NSString *) name logo: (NSString *) logo abbrName: (NSString *) abbrName desc: (NSString *) desc telephone: (NSString *) telephone serviceHotline: (NSString *) serviceHotline licenseNumber: (NSString *) licenseNumber businessLicense: (NSString *) businessLicense address: (NSString *) address tradeDsc: (NSString *) tradeDsc backImgs: (NSMutableArray *) backImgs papersImgs: (NSMutableArray *) papersImgs proCnt: (int64_t) proCnt;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) logo;
- (void) setLogo: (NSString *) logo;
#endif
- (BOOL) logoIsSet;

#if !__has_feature(objc_arc)
- (NSString *) abbrName;
- (void) setAbbrName: (NSString *) abbrName;
#endif
- (BOOL) abbrNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

#if !__has_feature(objc_arc)
- (NSString *) telephone;
- (void) setTelephone: (NSString *) telephone;
#endif
- (BOOL) telephoneIsSet;

#if !__has_feature(objc_arc)
- (NSString *) serviceHotline;
- (void) setServiceHotline: (NSString *) serviceHotline;
#endif
- (BOOL) serviceHotlineIsSet;

#if !__has_feature(objc_arc)
- (NSString *) licenseNumber;
- (void) setLicenseNumber: (NSString *) licenseNumber;
#endif
- (BOOL) licenseNumberIsSet;

#if !__has_feature(objc_arc)
- (NSString *) businessLicense;
- (void) setBusinessLicense: (NSString *) businessLicense;
#endif
- (BOOL) businessLicenseIsSet;

#if !__has_feature(objc_arc)
- (NSString *) address;
- (void) setAddress: (NSString *) address;
#endif
- (BOOL) addressIsSet;

#if !__has_feature(objc_arc)
- (NSString *) tradeDsc;
- (void) setTradeDsc: (NSString *) tradeDsc;
#endif
- (BOOL) tradeDscIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) backImgs;
- (void) setBackImgs: (NSMutableArray *) backImgs;
#endif
- (BOOL) backImgsIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) papersImgs;
- (void) setPapersImgs: (NSMutableArray *) papersImgs;
#endif
- (BOOL) papersImgsIsSet;

#if !__has_feature(objc_arc)
- (int64_t) proCnt;
- (void) setProCnt: (int64_t) proCnt;
#endif
- (BOOL) proCntIsSet;

@end

@interface NMTFMerStoreDot : NSObject <TBase, NSCoding> {
  int64_t __stId;
  int64_t __merId;
  NSString * __name;
  NSString * __abbrName;
  NSString * __address;
  NSString * __telephone;
  NSString * __desc;

  BOOL __stId_isset;
  BOOL __merId_isset;
  BOOL __name_isset;
  BOOL __abbrName_isset;
  BOOL __address_isset;
  BOOL __telephone_isset;
  BOOL __desc_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=stId, setter=setStId:) int64_t stId;
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=abbrName, setter=setAbbrName:) NSString * abbrName;
@property (nonatomic, retain, getter=address, setter=setAddress:) NSString * address;
@property (nonatomic, retain, getter=telephone, setter=setTelephone:) NSString * telephone;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
#endif

- (id) init;
- (id) initWithStId: (int64_t) stId merId: (int64_t) merId name: (NSString *) name abbrName: (NSString *) abbrName address: (NSString *) address telephone: (NSString *) telephone desc: (NSString *) desc;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) stId;
- (void) setStId: (int64_t) stId;
#endif
- (BOOL) stIdIsSet;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) abbrName;
- (void) setAbbrName: (NSString *) abbrName;
#endif
- (BOOL) abbrNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) address;
- (void) setAddress: (NSString *) address;
#endif
- (BOOL) addressIsSet;

#if !__has_feature(objc_arc)
- (NSString *) telephone;
- (void) setTelephone: (NSString *) telephone;
#endif
- (BOOL) telephoneIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

@end

@interface NMTFProDto : NSObject <TBase, NSCoding> {
  int64_t __proId;
  NSString * __name;
  int32_t __catId;
  NSString * __unit;
  NSString * __image;
  NSString * __price;
  NSString * __origPrice;
  int32_t __soldCnt;
  NSString * __desc;

  BOOL __proId_isset;
  BOOL __name_isset;
  BOOL __catId_isset;
  BOOL __unit_isset;
  BOOL __image_isset;
  BOOL __price_isset;
  BOOL __origPrice_isset;
  BOOL __soldCnt_isset;
  BOOL __desc_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, getter=catId, setter=setCatId:) int32_t catId;
@property (nonatomic, retain, getter=unit, setter=setUnit:) NSString * unit;
@property (nonatomic, retain, getter=image, setter=setImage:) NSString * image;
@property (nonatomic, retain, getter=price, setter=setPrice:) NSString * price;
@property (nonatomic, retain, getter=origPrice, setter=setOrigPrice:) NSString * origPrice;
@property (nonatomic, getter=soldCnt, setter=setSoldCnt:) int32_t soldCnt;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
#endif

- (id) init;
- (id) initWithProId: (int64_t) proId name: (NSString *) name catId: (int32_t) catId unit: (NSString *) unit image: (NSString *) image price: (NSString *) price origPrice: (NSString *) origPrice soldCnt: (int32_t) soldCnt desc: (NSString *) desc;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (int32_t) catId;
- (void) setCatId: (int32_t) catId;
#endif
- (BOOL) catIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) unit;
- (void) setUnit: (NSString *) unit;
#endif
- (BOOL) unitIsSet;

#if !__has_feature(objc_arc)
- (NSString *) image;
- (void) setImage: (NSString *) image;
#endif
- (BOOL) imageIsSet;

#if !__has_feature(objc_arc)
- (NSString *) price;
- (void) setPrice: (NSString *) price;
#endif
- (BOOL) priceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) origPrice;
- (void) setOrigPrice: (NSString *) origPrice;
#endif
- (BOOL) origPriceIsSet;

#if !__has_feature(objc_arc)
- (int32_t) soldCnt;
- (void) setSoldCnt: (int32_t) soldCnt;
#endif
- (BOOL) soldCntIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

@end

@interface NMTFProInfoMerDto : NSObject <TBase, NSCoding> {
  int64_t __merId;
  NSString * __merName;
  NSString * __merLogo;
  NSString * __city;

  BOOL __merId_isset;
  BOOL __merName_isset;
  BOOL __merLogo_isset;
  BOOL __city_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=merName, setter=setMerName:) NSString * merName;
@property (nonatomic, retain, getter=merLogo, setter=setMerLogo:) NSString * merLogo;
@property (nonatomic, retain, getter=city, setter=setCity:) NSString * city;
#endif

- (id) init;
- (id) initWithMerId: (int64_t) merId merName: (NSString *) merName merLogo: (NSString *) merLogo city: (NSString *) city;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merName;
- (void) setMerName: (NSString *) merName;
#endif
- (BOOL) merNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merLogo;
- (void) setMerLogo: (NSString *) merLogo;
#endif
- (BOOL) merLogoIsSet;

#if !__has_feature(objc_arc)
- (NSString *) city;
- (void) setCity: (NSString *) city;
#endif
- (BOOL) cityIsSet;

@end

@interface NMTFProInfoDto : NSObject <TBase, NSCoding> {
  int64_t __proId;
  NSString * __name;
  NSString * __desc;
  NSString * __unit;
  NSMutableArray * __proImgs;
  NSMutableArray * __briefImgs;
  NSString * __price;
  NSString * __origPrice;
  int32_t __soldCnt;
  int32_t __stockCnt;
  int32_t __tradeType;
  NMTFProInfoMerDto * __merInfo;
  NSString * __logiPrice;

  BOOL __proId_isset;
  BOOL __name_isset;
  BOOL __desc_isset;
  BOOL __unit_isset;
  BOOL __proImgs_isset;
  BOOL __briefImgs_isset;
  BOOL __price_isset;
  BOOL __origPrice_isset;
  BOOL __soldCnt_isset;
  BOOL __stockCnt_isset;
  BOOL __tradeType_isset;
  BOOL __merInfo_isset;
  BOOL __logiPrice_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
@property (nonatomic, retain, getter=unit, setter=setUnit:) NSString * unit;
@property (nonatomic, retain, getter=proImgs, setter=setProImgs:) NSMutableArray * proImgs;
@property (nonatomic, retain, getter=briefImgs, setter=setBriefImgs:) NSMutableArray * briefImgs;
@property (nonatomic, retain, getter=price, setter=setPrice:) NSString * price;
@property (nonatomic, retain, getter=origPrice, setter=setOrigPrice:) NSString * origPrice;
@property (nonatomic, getter=soldCnt, setter=setSoldCnt:) int32_t soldCnt;
@property (nonatomic, getter=stockCnt, setter=setStockCnt:) int32_t stockCnt;
@property (nonatomic, getter=tradeType, setter=setTradeType:) int32_t tradeType;
@property (nonatomic, retain, getter=merInfo, setter=setMerInfo:) NMTFProInfoMerDto * merInfo;
@property (nonatomic, retain, getter=logiPrice, setter=setLogiPrice:) NSString * logiPrice;
#endif

- (id) init;
- (id) initWithProId: (int64_t) proId name: (NSString *) name desc: (NSString *) desc unit: (NSString *) unit proImgs: (NSMutableArray *) proImgs briefImgs: (NSMutableArray *) briefImgs price: (NSString *) price origPrice: (NSString *) origPrice soldCnt: (int32_t) soldCnt stockCnt: (int32_t) stockCnt tradeType: (int32_t) tradeType merInfo: (NMTFProInfoMerDto *) merInfo logiPrice: (NSString *) logiPrice;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

#if !__has_feature(objc_arc)
- (NSString *) unit;
- (void) setUnit: (NSString *) unit;
#endif
- (BOOL) unitIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) proImgs;
- (void) setProImgs: (NSMutableArray *) proImgs;
#endif
- (BOOL) proImgsIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) briefImgs;
- (void) setBriefImgs: (NSMutableArray *) briefImgs;
#endif
- (BOOL) briefImgsIsSet;

#if !__has_feature(objc_arc)
- (NSString *) price;
- (void) setPrice: (NSString *) price;
#endif
- (BOOL) priceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) origPrice;
- (void) setOrigPrice: (NSString *) origPrice;
#endif
- (BOOL) origPriceIsSet;

#if !__has_feature(objc_arc)
- (int32_t) soldCnt;
- (void) setSoldCnt: (int32_t) soldCnt;
#endif
- (BOOL) soldCntIsSet;

#if !__has_feature(objc_arc)
- (int32_t) stockCnt;
- (void) setStockCnt: (int32_t) stockCnt;
#endif
- (BOOL) stockCntIsSet;

#if !__has_feature(objc_arc)
- (int32_t) tradeType;
- (void) setTradeType: (int32_t) tradeType;
#endif
- (BOOL) tradeTypeIsSet;

#if !__has_feature(objc_arc)
- (NMTFProInfoMerDto *) merInfo;
- (void) setMerInfo: (NMTFProInfoMerDto *) merInfo;
#endif
- (BOOL) merInfoIsSet;

#if !__has_feature(objc_arc)
- (NSString *) logiPrice;
- (void) setLogiPrice: (NSString *) logiPrice;
#endif
- (BOOL) logiPriceIsSet;

@end

@interface NMTFAddressDto : NSObject <TBase, NSCoding> {
  int64_t __addId;
  NSString * __consignee;
  NSString * __telephone;
  NSString * __district;
  NSString * __detail;
  int32_t __isDefault;

  BOOL __addId_isset;
  BOOL __consignee_isset;
  BOOL __telephone_isset;
  BOOL __district_isset;
  BOOL __detail_isset;
  BOOL __isDefault_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=addId, setter=setAddId:) int64_t addId;
@property (nonatomic, retain, getter=consignee, setter=setConsignee:) NSString * consignee;
@property (nonatomic, retain, getter=telephone, setter=setTelephone:) NSString * telephone;
@property (nonatomic, retain, getter=district, setter=setDistrict:) NSString * district;
@property (nonatomic, retain, getter=detail, setter=setDetail:) NSString * detail;
@property (nonatomic, getter=isDefault, setter=setIsDefault:) int32_t isDefault;
#endif

- (id) init;
- (id) initWithAddId: (int64_t) addId consignee: (NSString *) consignee telephone: (NSString *) telephone district: (NSString *) district detail: (NSString *) detail isDefault: (int32_t) isDefault;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) addId;
- (void) setAddId: (int64_t) addId;
#endif
- (BOOL) addIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) consignee;
- (void) setConsignee: (NSString *) consignee;
#endif
- (BOOL) consigneeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) telephone;
- (void) setTelephone: (NSString *) telephone;
#endif
- (BOOL) telephoneIsSet;

#if !__has_feature(objc_arc)
- (NSString *) district;
- (void) setDistrict: (NSString *) district;
#endif
- (BOOL) districtIsSet;

#if !__has_feature(objc_arc)
- (NSString *) detail;
- (void) setDetail: (NSString *) detail;
#endif
- (BOOL) detailIsSet;

#if !__has_feature(objc_arc)
- (int32_t) isDefault;
- (void) setIsDefault: (int32_t) isDefault;
#endif
- (BOOL) isDefaultIsSet;

@end

@interface NMTFCartProDto : NSObject <TBase, NSCoding> {
  int64_t __merId;
  NSString * __mName;
  NSMutableArray * __pros;

  BOOL __merId_isset;
  BOOL __mName_isset;
  BOOL __pros_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=mName, setter=setMName:) NSString * mName;
@property (nonatomic, retain, getter=pros, setter=setPros:) NSMutableArray * pros;
#endif

- (id) init;
- (id) initWithMerId: (int64_t) merId mName: (NSString *) mName pros: (NSMutableArray *) pros;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) mName;
- (void) setMName: (NSString *) mName;
#endif
- (BOOL) mNameIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) pros;
- (void) setPros: (NSMutableArray *) pros;
#endif
- (BOOL) prosIsSet;

@end

@interface NMTFBindingDto : NSObject <TBase, NSCoding> {
  NSString * __bankId;
  NSString * __bankCode;
  NSString * __bankName;
  NSString * __accountName;
  NSString * __accountNumber;
  NSString * __telephone;
  NSString * __txSnBinding;

  BOOL __bankId_isset;
  BOOL __bankCode_isset;
  BOOL __bankName_isset;
  BOOL __accountName_isset;
  BOOL __accountNumber_isset;
  BOOL __telephone_isset;
  BOOL __txSnBinding_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=bankId, setter=setBankId:) NSString * bankId;
@property (nonatomic, retain, getter=bankCode, setter=setBankCode:) NSString * bankCode;
@property (nonatomic, retain, getter=bankName, setter=setBankName:) NSString * bankName;
@property (nonatomic, retain, getter=accountName, setter=setAccountName:) NSString * accountName;
@property (nonatomic, retain, getter=accountNumber, setter=setAccountNumber:) NSString * accountNumber;
@property (nonatomic, retain, getter=telephone, setter=setTelephone:) NSString * telephone;
@property (nonatomic, retain, getter=txSnBinding, setter=setTxSnBinding:) NSString * txSnBinding;
#endif

- (id) init;
- (id) initWithBankId: (NSString *) bankId bankCode: (NSString *) bankCode bankName: (NSString *) bankName accountName: (NSString *) accountName accountNumber: (NSString *) accountNumber telephone: (NSString *) telephone txSnBinding: (NSString *) txSnBinding;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NSString *) bankId;
- (void) setBankId: (NSString *) bankId;
#endif
- (BOOL) bankIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bankCode;
- (void) setBankCode: (NSString *) bankCode;
#endif
- (BOOL) bankCodeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bankName;
- (void) setBankName: (NSString *) bankName;
#endif
- (BOOL) bankNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) accountName;
- (void) setAccountName: (NSString *) accountName;
#endif
- (BOOL) accountNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) accountNumber;
- (void) setAccountNumber: (NSString *) accountNumber;
#endif
- (BOOL) accountNumberIsSet;

#if !__has_feature(objc_arc)
- (NSString *) telephone;
- (void) setTelephone: (NSString *) telephone;
#endif
- (BOOL) telephoneIsSet;

#if !__has_feature(objc_arc)
- (NSString *) txSnBinding;
- (void) setTxSnBinding: (NSString *) txSnBinding;
#endif
- (BOOL) txSnBindingIsSet;

@end

@interface NMTFOrderMerDto : NSObject <TBase, NSCoding> {
  int64_t __merId;
  NSString * __name;
  NSString * __abbrName;
  NSString * __desc;
  NSString * __orderStatus;
  NSString * __logiPrice;
  NSString * __price;
  NSString * __orderMerNo;
  NSMutableArray * __merchantNos;
  NSMutableArray * __orderPros;

  BOOL __merId_isset;
  BOOL __name_isset;
  BOOL __abbrName_isset;
  BOOL __desc_isset;
  BOOL __orderStatus_isset;
  BOOL __logiPrice_isset;
  BOOL __price_isset;
  BOOL __orderMerNo_isset;
  BOOL __merchantNos_isset;
  BOOL __orderPros_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=abbrName, setter=setAbbrName:) NSString * abbrName;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
@property (nonatomic, retain, getter=orderStatus, setter=setOrderStatus:) NSString * orderStatus;
@property (nonatomic, retain, getter=logiPrice, setter=setLogiPrice:) NSString * logiPrice;
@property (nonatomic, retain, getter=price, setter=setPrice:) NSString * price;
@property (nonatomic, retain, getter=orderMerNo, setter=setOrderMerNo:) NSString * orderMerNo;
@property (nonatomic, retain, getter=merchantNos, setter=setMerchantNos:) NSMutableArray * merchantNos;
@property (nonatomic, retain, getter=orderPros, setter=setOrderPros:) NSMutableArray * orderPros;
#endif

- (id) init;
- (id) initWithMerId: (int64_t) merId name: (NSString *) name abbrName: (NSString *) abbrName desc: (NSString *) desc orderStatus: (NSString *) orderStatus logiPrice: (NSString *) logiPrice price: (NSString *) price orderMerNo: (NSString *) orderMerNo merchantNos: (NSMutableArray *) merchantNos orderPros: (NSMutableArray *) orderPros;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) abbrName;
- (void) setAbbrName: (NSString *) abbrName;
#endif
- (BOOL) abbrNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderStatus;
- (void) setOrderStatus: (NSString *) orderStatus;
#endif
- (BOOL) orderStatusIsSet;

#if !__has_feature(objc_arc)
- (NSString *) logiPrice;
- (void) setLogiPrice: (NSString *) logiPrice;
#endif
- (BOOL) logiPriceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) price;
- (void) setPrice: (NSString *) price;
#endif
- (BOOL) priceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderMerNo;
- (void) setOrderMerNo: (NSString *) orderMerNo;
#endif
- (BOOL) orderMerNoIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) merchantNos;
- (void) setMerchantNos: (NSMutableArray *) merchantNos;
#endif
- (BOOL) merchantNosIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) orderPros;
- (void) setOrderPros: (NSMutableArray *) orderPros;
#endif
- (BOOL) orderProsIsSet;

@end

@interface NMTFOrderProDto : NSObject <TBase, NSCoding> {
  int64_t __proId;
  NSString * __name;
  NSString * __abbrName;
  NSString * __desc;
  NSString * __price;
  NSString * __origPrice;
  int32_t __proNum;
  NSString * __imageUrl;

  BOOL __proId_isset;
  BOOL __name_isset;
  BOOL __abbrName_isset;
  BOOL __desc_isset;
  BOOL __price_isset;
  BOOL __origPrice_isset;
  BOOL __proNum_isset;
  BOOL __imageUrl_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=abbrName, setter=setAbbrName:) NSString * abbrName;
@property (nonatomic, retain, getter=desc, setter=setDesc:) NSString * desc;
@property (nonatomic, retain, getter=price, setter=setPrice:) NSString * price;
@property (nonatomic, retain, getter=origPrice, setter=setOrigPrice:) NSString * origPrice;
@property (nonatomic, getter=proNum, setter=setProNum:) int32_t proNum;
@property (nonatomic, retain, getter=imageUrl, setter=setImageUrl:) NSString * imageUrl;
#endif

- (id) init;
- (id) initWithProId: (int64_t) proId name: (NSString *) name abbrName: (NSString *) abbrName desc: (NSString *) desc price: (NSString *) price origPrice: (NSString *) origPrice proNum: (int32_t) proNum imageUrl: (NSString *) imageUrl;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) abbrName;
- (void) setAbbrName: (NSString *) abbrName;
#endif
- (BOOL) abbrNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) desc;
- (void) setDesc: (NSString *) desc;
#endif
- (BOOL) descIsSet;

#if !__has_feature(objc_arc)
- (NSString *) price;
- (void) setPrice: (NSString *) price;
#endif
- (BOOL) priceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) origPrice;
- (void) setOrigPrice: (NSString *) origPrice;
#endif
- (BOOL) origPriceIsSet;

#if !__has_feature(objc_arc)
- (int32_t) proNum;
- (void) setProNum: (int32_t) proNum;
#endif
- (BOOL) proNumIsSet;

#if !__has_feature(objc_arc)
- (NSString *) imageUrl;
- (void) setImageUrl: (NSString *) imageUrl;
#endif
- (BOOL) imageUrlIsSet;

@end

@interface NMTFOrderMerProsDto : NSObject <TBase, NSCoding> {
  int64_t __merId;
  NSString * __name;
  NSString * __logiPrice;
  NSString * __price;
  NSMutableArray * __orderPros;

  BOOL __merId_isset;
  BOOL __name_isset;
  BOOL __logiPrice_isset;
  BOOL __price_isset;
  BOOL __orderPros_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
@property (nonatomic, retain, getter=logiPrice, setter=setLogiPrice:) NSString * logiPrice;
@property (nonatomic, retain, getter=price, setter=setPrice:) NSString * price;
@property (nonatomic, retain, getter=orderPros, setter=setOrderPros:) NSMutableArray * orderPros;
#endif

- (id) init;
- (id) initWithMerId: (int64_t) merId name: (NSString *) name logiPrice: (NSString *) logiPrice price: (NSString *) price orderPros: (NSMutableArray *) orderPros;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) logiPrice;
- (void) setLogiPrice: (NSString *) logiPrice;
#endif
- (BOOL) logiPriceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) price;
- (void) setPrice: (NSString *) price;
#endif
- (BOOL) priceIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) orderPros;
- (void) setOrderPros: (NSMutableArray *) orderPros;
#endif
- (BOOL) orderProsIsSet;

@end

@interface NMTFBankDto : NSObject <TBase, NSCoding> {
  NSString * __bankId;
  NSString * __bankCode;
  NSString * __bankName;

  BOOL __bankId_isset;
  BOOL __bankCode_isset;
  BOOL __bankName_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=bankId, setter=setBankId:) NSString * bankId;
@property (nonatomic, retain, getter=bankCode, setter=setBankCode:) NSString * bankCode;
@property (nonatomic, retain, getter=bankName, setter=setBankName:) NSString * bankName;
#endif

- (id) init;
- (id) initWithBankId: (NSString *) bankId bankCode: (NSString *) bankCode bankName: (NSString *) bankName;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NSString *) bankId;
- (void) setBankId: (NSString *) bankId;
#endif
- (BOOL) bankIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bankCode;
- (void) setBankCode: (NSString *) bankCode;
#endif
- (BOOL) bankCodeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bankName;
- (void) setBankName: (NSString *) bankName;
#endif
- (BOOL) bankNameIsSet;

@end

@interface NMTFMtRespDtoConstants : NSObject {
}
@end