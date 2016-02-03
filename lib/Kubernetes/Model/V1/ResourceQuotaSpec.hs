-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.ResourceQuotaSpec
    ( ResourceQuotaSpec (..)
    , hard
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.V1.Any (Any)

-- | ResourceQuotaSpec defines the desired hard limits to enforce for Quota.
data ResourceQuotaSpec = ResourceQuotaSpec
    { _hard :: Maybe Any
    } deriving (Show, Eq, Generic)

makeLenses ''ResourceQuotaSpec

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''ResourceQuotaSpec)

instance Arbitrary ResourceQuotaSpec where
    arbitrary = ResourceQuotaSpec <$> arbitrary