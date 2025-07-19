package Services;

import java.io.Serializable;
import java.util.List;

import Models.Province;

public interface IProvinceService extends Serializable{

	List<Province> getListProvince();
}
