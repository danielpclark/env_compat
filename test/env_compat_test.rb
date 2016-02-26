require 'test_helper'

describe EnvCompat do
  it "encodes urls into environment friendly variables" do
    v = EnvCompat.encode "https://github.com/company/private-repo.git"
    _(v).must_equal "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
  end

  it "decodes urls from environment friendly variables" do
    v = EnvCompat.decode "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
    _(v).must_equal "https://github.com/company/private-repo.git".upcase
  end
end
