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

#import "Req.h"
#import "Resp.h"

@protocol NXTFApi1 <NSObject>
- (NXTFPingResp *) ping: (NXTFPingReq *) req;  // throws TException
- (NXTFGetPrefResp *) getPref: (NXTFGetPrefReq *) req;  // throws TException
- (NXTFSignUpResp *) signUp: (NXTFSignUpReq *) req;  // throws TException
- (NXTFSignInResp *) signIn: (NXTFSignInReq *) req;  // throws TException
- (NXTFSignOutResp *) signOut: (NXTFSignOutReq *) req;  // throws TException
- (NXTFH5SignUpResp *) h5SignUp: (NXTFH5SignUpReq *) req;  // throws TException
- (NXTFH5SignInResp *) h5SignIn: (NXTFH5SignInReq *) req;  // throws TException
- (NXTFGetDeptsResp *) getDepts: (NXTFGetDeptsReq *) req;  // throws TException
- (NXTFGetHospsResp *) getHosps: (NXTFGetHospsReq *) req;  // throws TException
- (NXTFGetHospMapsResp *) getHospMaps: (NXTFGetHospMapsReq *) req;  // throws TException
- (NXTFGetNoticeResp *) getNotice: (NXTFGetNoticeReq *) req;  // throws TException
- (NXTFGetGuideResp *) getGuide: (NXTFGetGuideReq *) req;  // throws TException
- (NXTFGetExpertsResp *) getExperts: (NXTFGetExpertsReq *) req;  // throws TException
- (NXTFGetCitiesResp *) getCities: (NXTFGetCitiesReq *) req;  // throws TException
- (NXTFGetLatestVerResp *) getLatestVer: (NXTFGetLatestVerReq *) req;  // throws TException
- (NXTFGetComDeptsResp *) getComDepts: (NXTFGetComDeptsReq *) req;  // throws TException
- (NXTFGetDictDataResp *) getDictData: (NXTFGetDictDataReq *) req;  // throws TException
- (NXTFGetDiseasesResp *) getDiseases: (NXTFGetDiseasesReq *) req;  // throws TException
- (NXTFGetDiseaseResp *) getDisease: (NXTFGetDiseaseReq *) req;  // throws TException
- (NXTFRegTargetsResp *) regTargets: (NXTFRegTargetsReq *) req;  // throws TException
- (NXTFRegPointsResp *) regPoints: (NXTFRegPointsReq *) req;  // throws TException
- (NXTFRegPointResp *) regPoint: (NXTFRegPointReq *) req;  // throws TException
- (NXTFRegHospPayResp *) regHospPay: (NXTFRegHospPayReq *) req;  // throws TException
- (NXTFReqAuthCodeResp *) reqAuthCode: (NXTFReqAuthCodeReq *) req;  // throws TException
- (NXTFGetPayWaysResp *) getPayWays: (NXTFGetPayWaysReq *) req;  // throws TException
- (NXTFGetPayInfoResp *) getPayInfo: (NXTFGetPayInfoReq *) req;  // throws TException
- (NXTFCancelRegResp *) cancelReg: (NXTFCancelRegReq *) req;  // throws TException
- (NXTFDescSymptomResp *) descSymptom: (NXTFDescSymptomReq *) req;  // throws TException
- (NXTFSendFlowerResp *) sendFlower: (NXTFSendFlowerReq *) req;  // throws TException
- (NXTFFavorDrResp *) favorDr: (NXTFFavorDrReq *) req;  // throws TException
- (NXTFFavorHospResp *) favorHosp: (NXTFFavorHospReq *) req;  // throws TException
- (NXTFFavorDiseaseResp *) favorDisease: (NXTFFavorDiseaseReq *) req;  // throws TException
- (NXTFGetFavorDrsResp *) getFavorDrs: (NXTFGetFavorDrsReq *) req;  // throws TException
- (NXTFGetFavorHospsResp *) getFavorHosps: (NXTFGetFavorHospsReq *) req;  // throws TException
- (NXTFGetFavorDiseasesResp *) getFavorDiseases: (NXTFGetFavorDiseasesReq *) req;  // throws TException
- (NXTFFeedbackResp *) feedback: (NXTFFeedbackReq *) req;  // throws TException
- (NXTFClientPaidResp *) clientPaid: (NXTFClientPaidReq *) req;  // throws TException
- (NXTFGetDrResp *) getDr: (NXTFGetDrReq *) req;  // throws TException
- (NXTFGetHospResp *) getHosp: (NXTFGetHospReq *) req;  // throws TException
- (NXTFGetSpecialtiesResp *) getSpecialties: (NXTFGetSpecialtiesReq *) req;  // throws TException
- (NXTFGetQueResp *) getQue: (NXTFGetQueReq *) req;  // throws TException
- (NXTFGetReportsResp *) getReports: (NXTFGetReportsReq *) req;  // throws TException
- (NXTFGetReportResp *) getReport: (NXTFGetReportReq *) req;  // throws TException
- (NXTFGetPacsImgResp *) getPacsImg: (NXTFGetPacsImgReq *) req;  // throws TException
- (NXTFGetRecipesResp *) getRecipes: (NXTFGetRecipesReq *) req;  // throws TException
- (NXTFOrderRecipeResp *) orderRecipe: (NXTFOrderRecipeReq *) req;  // throws TException
- (NXTFQueryPatientsResp *) queryPatients: (NXTFQueryPatientsReq *) req;  // throws TException
- (NXTFRegCardNoResp *) regCardNo: (NXTFRegCardNoReq *) req;  // throws TException
- (NXTFChangePwdResp *) changePwd: (NXTFChangePwdReq *) req;  // throws TException
- (NXTFFindHospsResp *) findHosps: (NXTFFindHospsReq *) req;  // throws TException
- (NXTFFindDoctorsResp *) findDoctors: (NXTFFindDoctorsReq *) req;  // throws TException
- (NXTFBindMedCardResp *) bindMedCard: (NXTFBindMedCardReq *) req;  // throws TException
- (NXTFGetMedCardsResp *) getMedCards: (NXTFGetMedCardsReq *) req;  // throws TException
- (NXTFGetMedCardResp *) getMedCard: (NXTFGetMedCardReq *) req;  // throws TException
- (NXTFAddPatientResp *) addPatient: (NXTFAddPatientReq *) req;  // throws TException
- (NXTFModifyPatientResp *) modifyPatient: (NXTFModifyPatientReq *) req;  // throws TException
- (NXTFRemovePatientResp *) removePatient: (NXTFRemovePatientReq *) req;  // throws TException
- (NXTFBindInpatientNoResp *) bindInpatientNo: (NXTFBindInpatientNoReq *) req;  // throws TException
- (NXTFGetInpatientInfosResp *) getInpatientInfos: (NXTFGetInpatientInfosReq *) req;  // throws TException
- (NXTFGetInpatientInfoResp *) getInpatientInfo: (NXTFGetInpatientInfoReq *) req;  // throws TException
- (NXTFInpatientPrePaymentResp *) inpatientPrePayment: (NXTFInpatientPrePaymentReq *) req;  // throws TException
- (NXTFGetPrePaymentDetailResp *) getPrePaymentDetail: (NXTFGetPrePaymentDetailReq *) req;  // throws TException
- (NXTFGetInpatientFeeDetailResp *) getInpatientFeeDetail: (NXTFGetInpatientFeeDetailReq *) req;  // throws TException
- (NXTFGetInpatientFeeListResp *) getInpatientFeeList: (NXTFGetInpatientFeeListReq *) req;  // throws TException
- (NXTFGDSearchResp *) gdSearch: (NXTFGDSearchReq *) req;  // throws TException
- (NXTFUpdateUserResp *) updateUser: (NXTFUpdateUserReq *) req;  // throws TException
- (NXTFGetMedInfosResp *) getMedInfos: (NXTFGetMedInfosReq *) req;  // throws TException
- (NXTFGetRegResp *) getReg: (NXTFGetRegReq *) req;  // throws TException
- (NXTFAddConsultResp *) addConsult: (NXTFAddConsultReq *) req;  // throws TException
- (NXTFGetConsultsResp *) getConsults: (NXTFGetConsultsReq *) req;  // throws TException
- (NXTFAddEvaluateResp *) addEvaluate: (NXTFAddEvaluateReq *) req;  // throws TException
- (NXTFGetEvaluatesResp *) getEvaluates: (NXTFGetEvaluatesReq *) req;  // throws TException
- (NXTFPullMsgsResp *) pullMsgs: (NXTFPullMsgsReq *) req;  // throws TException
- (NXTFGetRegDatesResp *) getRegDates: (NXTFGetRegDatesReq *) req;  // throws TException
- (NXTFGetHospAnnResp *) getHospAnn: (NXTFGetHospAnnReq *) req;  // throws TException
- (NXTFGetDescSymptomResp *) getDescSymptom: (NXTFGetDescSymptomReq *) req;  // throws TException
- (NXTFGetAdvertisResp *) getAdvertis: (NXTFGetAdvertisReq *) req;  // throws TException
- (NXTFPointNumResp *) pointNum: (NXTFPointNumReq *) req;  // throws TException
- (NXTFPatientHeadResp *) uploadPatientHead: (NXTFPatientHeadReq *) req;  // throws TException
- (NXTFGetAutognosisSymsResp *) getAutognosisSyms: (NXTFGetAutognosisSymsReq *) req;  // throws TException
- (NXTFGetAutognosisDetailResp *) getAutognosisDetail: (NXTFGetAutognosisDetailReq *) req;  // throws TException
- (NXTFGetAutognosisDisResp *) getAutognosisDis: (NXTFGetAutognosisDisReq *) req;  // throws TException
- (NXTFSetDefaultCardResp *) setDefaultCard: (NXTFSetDefaultCardReq *) req;  // throws TException
- (NXTFRemoveMedCardResp *) removeMedCard: (NXTFRemoveMedCardReq *) req;  // throws TException
- (NXTFCheckInResp *) checkIn: (NXTFCheckInReq *) req;  // throws TException
- (NXTFGetStartPicsResp *) getStartPics: (NXTFGetStartPicsReq *) req;  // throws TException
- (NXTFGetMedRecordResp *) getMedRecord: (NXTFGetMedRecordReq *) req;  // throws TException
- (NXTFOrderChargeResp *) orderCharge: (NXTFOrderChargeReq *) req;  // throws TException
- (NXTFGetChargeBalanceResp *) getChargeBalance: (NXTFGetChargeBalanceReq *) req;  // throws TException
- (NXTFGetImHostsResp *) getImHosts: (NXTFGetImHostsReq *) req;  // throws TException
- (NXTFRegisterImResp *) registerIm: (NXTFRegisterImReq *) req;  // throws TException
- (NXTFGetDrImIdResp *) getDrImId: (NXTFGetDrImIdReq *) req;  // throws TException
- (NXTFRegistConsultResp *) registConsult: (NXTFRegistConsultReq *) req;  // throws TException
- (NXTFFileDownloadResp *) fileDownload: (NXTFFileDownloadReq *) req;  // throws TException
- (NXTFFileUploadResp *) fileUpload: (NXTFFileUploadReq *) req;  // throws TException
- (NXTFGetEmrInfoResp *) getEmrInfo: (NXTFGetEmrInfoReq *) req;  // throws TException
- (NXTFGetVisitsResp *) getVisits: (NXTFGetVisitsReq *) req;  // throws TException
- (NXTFPhysicalRptInfoResp *) GetPhysicalRptInfos: (NXTFPhysicalRptInfoReq *) physicalRptInfoReq;  // throws TException
- (NXTFPhysicalReportResp *) GetPhysicalReport: (NXTFPhysicalReportReq *) physicalReportReq;  // throws TException
- (NXTFGetRecomOptsResp *) getRecomOpts: (NXTFGetRecomOptsReq *) req;  // throws TException
- (NXTFGetInsInfosResp *) getInsInfos: (NXTFGetInsInfosReq *) req;  // throws TException
- (NXTFGetInsPkgResp *) getInsPkg: (NXTFGetInsPkgReq *) req;  // throws TException
- (NXTFGetStInsCalResultResp *) getStInsCalRs: (NXTFGetStInsCalResultReq *) req;  // throws TException
- (NXTFOrderStInsResp *) orderStIns: (NXTFOrderStInsReq *) req;  // throws TException
- (NXTFGetStInsPayInfoResp *) getStInsPayInfo: (NXTFGetStInsPayInfoReq *) req;  // throws TException
- (NXTFGetStInsDetailResp *) getStInsDetail: (NXTFGetStInsDetailReq *) req;  // throws TException
- (NXTFGetStInsBanksResp *) getBanks: (NXTFGetStInsBanksReq *) req;  // throws TException
- (NXTFReqStInsClaimResp *) reqStInsClaim: (NXTFReqStInsClaimReq *) req;  // throws TException
- (NXTFGetMyPayInfosResp *) getMyPayInfos: (NXTFGetMyPayInfosReq *) req;  // throws TException
- (NXTFGetLastestActResp *) getLastestAct: (NXTFGetLastestActReq *) req;  // throws TException
- (NXTFGetActsResp *) getActs: (NXTFGetActsReq *) req;  // throws TException
- (NXTFGetActDetailResp *) getActDetail: (NXTFGetActDetailReq *) req;  // throws TException
- (NXTFRegLiveResp *) registerLive: (NXTFRegLiveReq *) req;  // throws TException
- (NXTFGetBannersResp *) getBanners: (NXTFGetBannersReq *) req;  // throws TException
- (NXTFTerminateConsultationResp *) terminateConsultation: (NXTFTerminateConsultationReq *) req;  // throws TException
- (NXTFGetHealthProfileResp *) getHealthProfile: (NXTFGetHealthProfileReq *) req;  // throws TException
- (NXTFGetVisitListResp *) getVisitList: (NXTFGetVisitListReq *) req;  // throws TException
- (NXTFGetVisitDetailResp *) getVisitDetail: (NXTFGetVisitDetailReq *) req;  // throws TException
- (NXTFGetConsultationResp *) getConsultation: (NXTFGetConsultationReq *) req;  // throws TException
- (NXTFAuthPmrResp *) authPmr: (NXTFAuthPmrReq *) req;  // throws TException
- (NXTFUpLoadTreatPicResp *) upLoadTreatPic: (NXTFUpLoadTreatPicReq *) req;  // throws TException
- (NXTFGetQueInfoResp *) getQueInfo: (NXTFGetQueInfoReq *) req;  // throws TException
- (NXTFStatDataResp *) uploadStatData: (NXTFStatDataReq *) req;  // throws TException
- (NXTFSignContractResp *) signContract: (NXTFSignContractReq *) req;  // throws TException
- (NXTFGetPackageInfosResp *) getPackageInfos: (NXTFGetPackageInfosReq *) req;  // throws TException
- (NXTFGetMyDoctorResp *) getMyDoctor: (NXTFGetMyDoctorReq *) req;  // throws TException
- (NXTFLinkPatResp *) linkPat: (NXTFLinkPatReq *) req;  // throws TException
- (NXTFGetRegistedDeptResp *) getRegistedDept: (NXTFGetRegistedDeptReq *) req;  // throws TException
- (NXTFDeptDocsResp *) getDeptDocs: (NXTFDeptDocsReq *) req;  // throws TException
@end

@interface NXTFApi1Client : TBaseClient <NXTFApi1> - (id) initWithProtocol: (id <TProtocol>) protocol;
- (id) initWithInProtocol: (id <TProtocol>) inProtocol outProtocol: (id <TProtocol>) outProtocol;
@end

@interface NXTFApi1Processor : NSObject <TProcessor> {
  id <NXTFApi1> mService;
  NSDictionary * mMethodMap;
}
- (id) initWithApi1: (id <NXTFApi1>) service;
- (id<NXTFApi1>) service;
@end

@interface NXTFApiConstants : NSObject {
}
@end
