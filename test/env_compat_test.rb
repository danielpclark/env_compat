require 'test_helper'

describe EnvCompat do
  it "automatiacally handles string based on tag" do
    str = "https://github.com/company/private-repo.git"
    r = EnvCompat.auto(:bundle, str)
    _(r).must_equal "BUNDLE_HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
    s = EnvCompat.auto(:bundle, r)
    _(s).must_equal str.upcase
  end

  it "encodes urls into environment friendly variables" do
    v = EnvCompat.encode "https://github.com/company/private-repo.git"
    _(v).must_equal "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
  end

  it "decodes urls from environment friendly variables" do
    v = EnvCompat.decode "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
    _(v).must_equal "https://github.com/company/private-repo.git".upcase
  end

  it "must have an underscore character mapping" do
    _(EnvCompat.instance_eval {mapping.values}).must_include '_'
  end
end
