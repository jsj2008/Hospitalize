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

@interface NMTFGetMtBannersReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;

  BOOL __header_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

@end

@interface NMTFGetMtProCatsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;

  BOOL __header_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

@end

@interface NMTFGetMtMersReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  NSString * __merType;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __merType_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, retain, getter=merType, setter=setMerType:) NSString * merType;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page merType: (NSString *) merType;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merType;
- (void) setMerType: (NSString *) merType;
#endif
- (BOOL) merTypeIsSet;

@end

@interface NMTFGetMtMerInfoReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int64_t __merId;

  BOOL __header_isset;
  BOOL __merId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header merId: (int64_t) merId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

@end

@interface NMTFGetMtMerStoresReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  int64_t __merId;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __merId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page merId: (int64_t) merId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

@end

@interface NMTFGetMtProsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  int32_t __proType;
  int64_t __merId;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __proType_isset;
  BOOL __merId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, getter=proType, setter=setProType:) int32_t proType;
@property (nonatomic, getter=merId, setter=setMerId:) int64_t merId;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page proType: (int32_t) proType merId: (int64_t) merId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (int32_t) proType;
- (void) setProType: (int32_t) proType;
#endif
- (BOOL) proTypeIsSet;

#if !__has_feature(objc_arc)
- (int64_t) merId;
- (void) setMerId: (int64_t) merId;
#endif
- (BOOL) merIdIsSet;

@end

@interface NMTFGetMtProInfoReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int64_t __proId;

  BOOL __header_isset;
  BOOL __proId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header proId: (int64_t) proId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

@end

@interface NMTFFindMtMerProsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  NSString * __keyword;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __keyword_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, retain, getter=keyword, setter=setKeyword:) NSString * keyword;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page keyword: (NSString *) keyword;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (NSString *) keyword;
- (void) setKeyword: (NSString *) keyword;
#endif
- (BOOL) keywordIsSet;

@end

@interface NMTFGetMtShipAddsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  int32_t __isDefault;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __isDefault_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, getter=isDefault, setter=setIsDefault:) int32_t isDefault;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page isDefault: (int32_t) isDefault;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (int32_t) isDefault;
- (void) setIsDefault: (int32_t) isDefault;
#endif
- (BOOL) isDefaultIsSet;

@end

@interface NMTFEditMtShipAddReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int32_t __editType;
  int64_t __addId;
  NSString * __consignee;
  NSString * __telephone;
  NSString * __district;
  NSString * __detail;
  int32_t __isDefault;

  BOOL __header_isset;
  BOOL __editType_isset;
  BOOL __addId_isset;
  BOOL __consignee_isset;
  BOOL __telephone_isset;
  BOOL __district_isset;
  BOOL __detail_isset;
  BOOL __isDefault_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=editType, setter=setEditType:) int32_t editType;
@property (nonatomic, getter=addId, setter=setAddId:) int64_t addId;
@property (nonatomic, retain, getter=consignee, setter=setConsignee:) NSString * consignee;
@property (nonatomic, retain, getter=telephone, setter=setTelephone:) NSString * telephone;
@property (nonatomic, retain, getter=district, setter=setDistrict:) NSString * district;
@property (nonatomic, retain, getter=detail, setter=setDetail:) NSString * detail;
@property (nonatomic, getter=isDefault, setter=setIsDefault:) int32_t isDefault;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header editType: (int32_t) editType addId: (int64_t) addId consignee: (NSString *) consignee telephone: (NSString *) telephone district: (NSString *) district detail: (NSString *) detail isDefault: (int32_t) isDefault;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int32_t) editType;
- (void) setEditType: (int32_t) editType;
#endif
- (BOOL) editTypeIsSet;

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

@interface NMTFGetMtCartProsCntReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;

  BOOL __header_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

@end

@interface NMTFGetMtCartProsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;

  BOOL __header_isset;
  BOOL __page_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

@end

@interface NMTFEditMtCartProsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int32_t __editType;
  int64_t __proId;
  int32_t __proCnt;

  BOOL __header_isset;
  BOOL __editType_isset;
  BOOL __proId_isset;
  BOOL __proCnt_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=editType, setter=setEditType:) int32_t editType;
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
@property (nonatomic, getter=proCnt, setter=setProCnt:) int32_t proCnt;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header editType: (int32_t) editType proId: (int64_t) proId proCnt: (int32_t) proCnt;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int32_t) editType;
- (void) setEditType: (int32_t) editType;
#endif
- (BOOL) editTypeIsSet;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

#if !__has_feature(objc_arc)
- (int32_t) proCnt;
- (void) setProCnt: (int32_t) proCnt;
#endif
- (BOOL) proCntIsSet;

@end

@interface NMTFCreateMtOrderReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSMutableArray * __pros;
  int64_t __addId;
  int32_t __invType;
  NSString * __invHead;

  BOOL __header_isset;
  BOOL __pros_isset;
  BOOL __addId_isset;
  BOOL __invType_isset;
  BOOL __invHead_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=pros, setter=setPros:) NSMutableArray * pros;
@property (nonatomic, getter=addId, setter=setAddId:) int64_t addId;
@property (nonatomic, getter=invType, setter=setInvType:) int32_t invType;
@property (nonatomic, retain, getter=invHead, setter=setInvHead:) NSString * invHead;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header pros: (NSMutableArray *) pros addId: (int64_t) addId invType: (int32_t) invType invHead: (NSString *) invHead;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) pros;
- (void) setPros: (NSMutableArray *) pros;
#endif
- (BOOL) prosIsSet;

#if !__has_feature(objc_arc)
- (int64_t) addId;
- (void) setAddId: (int64_t) addId;
#endif
- (BOOL) addIdIsSet;

#if !__has_feature(objc_arc)
- (int32_t) invType;
- (void) setInvType: (int32_t) invType;
#endif
- (BOOL) invTypeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) invHead;
- (void) setInvHead: (NSString *) invHead;
#endif
- (BOOL) invHeadIsSet;

@end

@interface NMTFOrderProsDto : NSObject <TBase, NSCoding> {
  int64_t __proId;
  int32_t __proNum;

  BOOL __proId_isset;
  BOOL __proNum_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=proId, setter=setProId:) int64_t proId;
@property (nonatomic, getter=proNum, setter=setProNum:) int32_t proNum;
#endif

- (id) init;
- (id) initWithProId: (int64_t) proId proNum: (int32_t) proNum;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) proId;
- (void) setProId: (int64_t) proId;
#endif
- (BOOL) proIdIsSet;

#if !__has_feature(objc_arc)
- (int32_t) proNum;
- (void) setProNum: (int32_t) proNum;
#endif
- (BOOL) proNumIsSet;

@end

@interface NMTFCancelMtOrderReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;

  BOOL __header_isset;
  BOOL __orderNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

@end

@interface NMTFDelMtOrderReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;

  BOOL __header_isset;
  BOOL __orderNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

@end

@interface NMTFPrePayMtOrderReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;
  int32_t __isMall;
  int32_t __payWayType;
  NSString * __txSNBinding;
  NSString * __merchantNo;

  BOOL __header_isset;
  BOOL __orderNo_isset;
  BOOL __isMall_isset;
  BOOL __payWayType_isset;
  BOOL __txSNBinding_isset;
  BOOL __merchantNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
@property (nonatomic, getter=isMall, setter=setIsMall:) int32_t isMall;
@property (nonatomic, getter=payWayType, setter=setPayWayType:) int32_t payWayType;
@property (nonatomic, retain, getter=txSNBinding, setter=setTxSNBinding:) NSString * txSNBinding;
@property (nonatomic, retain, getter=merchantNo, setter=setMerchantNo:) NSString * merchantNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo isMall: (int32_t) isMall payWayType: (int32_t) payWayType txSNBinding: (NSString *) txSNBinding merchantNo: (NSString *) merchantNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

#if !__has_feature(objc_arc)
- (int32_t) isMall;
- (void) setIsMall: (int32_t) isMall;
#endif
- (BOOL) isMallIsSet;

#if !__has_feature(objc_arc)
- (int32_t) payWayType;
- (void) setPayWayType: (int32_t) payWayType;
#endif
- (BOOL) payWayTypeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) txSNBinding;
- (void) setTxSNBinding: (NSString *) txSNBinding;
#endif
- (BOOL) txSNBindingIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merchantNo;
- (void) setMerchantNo: (NSString *) merchantNo;
#endif
- (BOOL) merchantNoIsSet;

@end

@interface NMTFPayMtOrderReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;
  int32_t __isMall;
  NSString * __smsCode;

  BOOL __header_isset;
  BOOL __orderNo_isset;
  BOOL __isMall_isset;
  BOOL __smsCode_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
@property (nonatomic, getter=isMall, setter=setIsMall:) int32_t isMall;
@property (nonatomic, retain, getter=smsCode, setter=setSmsCode:) NSString * smsCode;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo isMall: (int32_t) isMall smsCode: (NSString *) smsCode;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

#if !__has_feature(objc_arc)
- (int32_t) isMall;
- (void) setIsMall: (int32_t) isMall;
#endif
- (BOOL) isMallIsSet;

#if !__has_feature(objc_arc)
- (NSString *) smsCode;
- (void) setSmsCode: (NSString *) smsCode;
#endif
- (BOOL) smsCodeIsSet;

@end

@interface NMTFGetMtBindingsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __merchantNo;

  BOOL __header_isset;
  BOOL __merchantNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=merchantNo, setter=setMerchantNo:) NSString * merchantNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header merchantNo: (NSString *) merchantNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merchantNo;
- (void) setMerchantNo: (NSString *) merchantNo;
#endif
- (BOOL) merchantNoIsSet;

@end

@interface NMTFReceiptMtProsReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;

  BOOL __header_isset;
  BOOL __orderNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

@end

@interface NMTFReqMtRefundReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;
  NSString * __refundReason;

  BOOL __header_isset;
  BOOL __orderNo_isset;
  BOOL __refundReason_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
@property (nonatomic, retain, getter=refundReason, setter=setRefundReason:) NSString * refundReason;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo refundReason: (NSString *) refundReason;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

#if !__has_feature(objc_arc)
- (NSString *) refundReason;
- (void) setRefundReason: (NSString *) refundReason;
#endif
- (BOOL) refundReasonIsSet;

@end

@interface NMTFGetUserOrderListReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NMTFPage * __page;
  int32_t __searchType;

  BOOL __header_isset;
  BOOL __page_isset;
  BOOL __searchType_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=page, setter=setPage:) NMTFPage * page;
@property (nonatomic, getter=searchType, setter=setSearchType:) int32_t searchType;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header page: (NMTFPage *) page searchType: (int32_t) searchType;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NMTFPage *) page;
- (void) setPage: (NMTFPage *) page;
#endif
- (BOOL) pageIsSet;

#if !__has_feature(objc_arc)
- (int32_t) searchType;
- (void) setSearchType: (int32_t) searchType;
#endif
- (BOOL) searchTypeIsSet;

@end

@interface NMTFGetMtOrderDetailReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __orderNo;

  BOOL __header_isset;
  BOOL __orderNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=orderNo, setter=setOrderNo:) NSString * orderNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header orderNo: (NSString *) orderNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) orderNo;
- (void) setOrderNo: (NSString *) orderNo;
#endif
- (BOOL) orderNoIsSet;

@end

@interface NMTFGetPayBanksReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int32_t __payTypeId;

  BOOL __header_isset;
  BOOL __payTypeId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=payTypeId, setter=setPayTypeId:) int32_t payTypeId;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header payTypeId: (int32_t) payTypeId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int32_t) payTypeId;
- (void) setPayTypeId: (int32_t) payTypeId;
#endif
- (BOOL) payTypeIdIsSet;

@end

@interface NMTFPreBindBankCardReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  int32_t __transType;
  int32_t __payTypeId;
  NSString * __papersType;
  NSString * __papersNo;
  NSString * __bankId;
  NSString * __accountName;
  NSString * __accountNumber;
  NSString * __phoneNumber;
  NSString * __province;
  NSString * __city;
  NSString * __branchName;
  NSString * __merchantNo;

  BOOL __header_isset;
  BOOL __transType_isset;
  BOOL __payTypeId_isset;
  BOOL __papersType_isset;
  BOOL __papersNo_isset;
  BOOL __bankId_isset;
  BOOL __accountName_isset;
  BOOL __accountNumber_isset;
  BOOL __phoneNumber_isset;
  BOOL __province_isset;
  BOOL __city_isset;
  BOOL __branchName_isset;
  BOOL __merchantNo_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, getter=transType, setter=setTransType:) int32_t transType;
@property (nonatomic, getter=payTypeId, setter=setPayTypeId:) int32_t payTypeId;
@property (nonatomic, retain, getter=papersType, setter=setPapersType:) NSString * papersType;
@property (nonatomic, retain, getter=papersNo, setter=setPapersNo:) NSString * papersNo;
@property (nonatomic, retain, getter=bankId, setter=setBankId:) NSString * bankId;
@property (nonatomic, retain, getter=accountName, setter=setAccountName:) NSString * accountName;
@property (nonatomic, retain, getter=accountNumber, setter=setAccountNumber:) NSString * accountNumber;
@property (nonatomic, retain, getter=phoneNumber, setter=setPhoneNumber:) NSString * phoneNumber;
@property (nonatomic, retain, getter=province, setter=setProvince:) NSString * province;
@property (nonatomic, retain, getter=city, setter=setCity:) NSString * city;
@property (nonatomic, retain, getter=branchName, setter=setBranchName:) NSString * branchName;
@property (nonatomic, retain, getter=merchantNo, setter=setMerchantNo:) NSString * merchantNo;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header transType: (int32_t) transType payTypeId: (int32_t) payTypeId papersType: (NSString *) papersType papersNo: (NSString *) papersNo bankId: (NSString *) bankId accountName: (NSString *) accountName accountNumber: (NSString *) accountNumber phoneNumber: (NSString *) phoneNumber province: (NSString *) province city: (NSString *) city branchName: (NSString *) branchName merchantNo: (NSString *) merchantNo;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (int32_t) transType;
- (void) setTransType: (int32_t) transType;
#endif
- (BOOL) transTypeIsSet;

#if !__has_feature(objc_arc)
- (int32_t) payTypeId;
- (void) setPayTypeId: (int32_t) payTypeId;
#endif
- (BOOL) payTypeIdIsSet;

#if !__has_feature(objc_arc)
- (NSString *) papersType;
- (void) setPapersType: (NSString *) papersType;
#endif
- (BOOL) papersTypeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) papersNo;
- (void) setPapersNo: (NSString *) papersNo;
#endif
- (BOOL) papersNoIsSet;

#if !__has_feature(objc_arc)
- (NSString *) bankId;
- (void) setBankId: (NSString *) bankId;
#endif
- (BOOL) bankIdIsSet;

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
- (NSString *) phoneNumber;
- (void) setPhoneNumber: (NSString *) phoneNumber;
#endif
- (BOOL) phoneNumberIsSet;

#if !__has_feature(objc_arc)
- (NSString *) province;
- (void) setProvince: (NSString *) province;
#endif
- (BOOL) provinceIsSet;

#if !__has_feature(objc_arc)
- (NSString *) city;
- (void) setCity: (NSString *) city;
#endif
- (BOOL) cityIsSet;

#if !__has_feature(objc_arc)
- (NSString *) branchName;
- (void) setBranchName: (NSString *) branchName;
#endif
- (BOOL) branchNameIsSet;

#if !__has_feature(objc_arc)
- (NSString *) merchantNo;
- (void) setMerchantNo: (NSString *) merchantNo;
#endif
- (BOOL) merchantNoIsSet;

@end

@interface NMTFBindBankCardReq : NSObject <TBase, NSCoding> {
  NMTFReqHeader * __header;
  NSString * __txSNBinding;
  NSString * __smsValidCode;

  BOOL __header_isset;
  BOOL __txSNBinding_isset;
  BOOL __smsValidCode_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=header, setter=setHeader:) NMTFReqHeader * header;
@property (nonatomic, retain, getter=txSNBinding, setter=setTxSNBinding:) NSString * txSNBinding;
@property (nonatomic, retain, getter=smsValidCode, setter=setSmsValidCode:) NSString * smsValidCode;
#endif

- (id) init;
- (id) initWithHeader: (NMTFReqHeader *) header txSNBinding: (NSString *) txSNBinding smsValidCode: (NSString *) smsValidCode;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NMTFReqHeader *) header;
- (void) setHeader: (NMTFReqHeader *) header;
#endif
- (BOOL) headerIsSet;

#if !__has_feature(objc_arc)
- (NSString *) txSNBinding;
- (void) setTxSNBinding: (NSString *) txSNBinding;
#endif
- (BOOL) txSNBindingIsSet;

#if !__has_feature(objc_arc)
- (NSString *) smsValidCode;
- (void) setSmsValidCode: (NSString *) smsValidCode;
#endif
- (BOOL) smsValidCodeIsSet;

@end

@interface NMTFMtReqConstants : NSObject {
}
@end
